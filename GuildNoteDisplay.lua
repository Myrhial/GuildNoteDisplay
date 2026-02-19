-- Initialisation
local appName, app = ...    -- App name and app table
app.L = app.L or {} -- Localisation table
local L = app.L;	-- Localisation table
app.api = {}    -- Api table for our app
GuildNoteDisplay = app.api  -- Api namespace
local api = app.api -- Api prefix for easier access
app.Name = "Guild Note Display"	-- Do not localize

-- Event registration
local event = CreateFrame("Frame")
event:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		self[event](self, ...)
	end
end)
event:RegisterEvent("ADDON_LOADED")
event:RegisterEvent("CHAT_MSG_SYSTEM")

-- Initial load
function app.Initialise()
	-- Declare SavedVariables
	if not GuildNoteDisplayDB then GuildNoteDisplayDB = {} end
	
	-- Enable default user settings
	if GuildNoteDisplayDB["colour_guild_note"] == nil then 
		GuildNoteDisplayDB["colour_guild_note"] = true
	end

	if GuildNoteDisplayDB["note_colour_table"] == nil then 
        GuildNoteDisplayDB["note_colour_table"] = {
			r=1,
			g=1,
			b=1,
		}
    end

	if GuildNoteDisplayDB["note_in_author_field"] == nil then 
		GuildNoteDisplayDB["note_in_author_field"] = false
	end

	if GuildNoteDisplayDB["normalise_special_characters"] == nil then 
		GuildNoteDisplayDB["normalise_special_characters"] = false
	end

	if GuildNoteDisplayDB["use_officer_note"] == nil then 
		GuildNoteDisplayDB["use_officer_note"] = false
	end

	if GuildNoteDisplayDB["display_party_raid_chat"] == nil then 
		GuildNoteDisplayDB["display_party_raid_chat"] = true
	end

	if GuildNoteDisplayDB["hide"] == nil then 
		GuildNoteDisplayDB["hide"] = false
	end
end

-- Minimap icon
function app.MinimapIcon()
	local LDB = LibStub("LibDataBroker-1.1")
	local icon = LDB:NewDataObject(appName, {
		type = "data source",
		text = app.Name,
		icon = "Interface\\AddOns\\GuildNoteDisplay\\GuildNoteDisplay.blp",
		OnClick = function() 
			app.OpenSettings()
		end,
	})

	app.MinimapIcon = LibStub("LibDBIcon-1.0")
	app.MinimapIcon:Register(appName, icon, GuildNoteDisplayDB)
end

-- Addon is loaded
function event:ADDON_LOADED(addOnName, containsBindings)
	if addOnName == appName then
        app.Initialise()
        app.Settings()
		app.MinimapIcon()
		app.AddMessageEventFilters()
    end
end

-- Color picker
function app.ShowColorPicker(configTable)
	local r, g, b, a = GuildNoteDisplayDB.note_colour_table.r, GuildNoteDisplayDB.note_colour_table.g, GuildNoteDisplayDB.note_colour_table.b, GuildNoteDisplayDB.note_colour_table.a;

	local function OnColorChanged()
		local newR, newG, newB = ColorPickerFrame:GetColorRGB();
		local newA = ColorPickerFrame:GetColorAlpha();
		GuildNoteDisplayDB.note_colour_table.r, GuildNoteDisplayDB.note_colour_table.g, GuildNoteDisplayDB.note_colour_table.b, GuildNoteDisplayDB.note_colour_table.a = newR, newG, newB, newA;
	end

	local function OnCancel()
		GuildNoteDisplayDB.note_colour_table.r, GuildNoteDisplayDB.note_colour_table.g, GuildNoteDisplayDB.note_colour_table.b, GuildNoteDisplayDB.note_colour_table.a = r, g, b, a;
	end

	local options = {
		swatchFunc = OnColorChanged,
		opacityFunc = OnColorChanged,
		cancelFunc = OnCancel,
		hasOpacity = a ~= nil,
		opacity = a,
		r = r,
		g = g,
		b = b,
	};

	ColorPickerFrame:SetupColorPickerAndShow(options);
end

-- Open settings
function app.OpenSettings()
	Settings.OpenToCategory(app.Category:GetID())
end

-- AddOn Compartment Click
function GuildNoteDisplay_Click(self, button)
    app.OpenSettings()
end

-- Slash command to open settings
SLASH_GUILDNOTEDISPLAY1 = "/gnd";
SLASH_GUILDNOTEDISPLAY2 = "/guildnotedisplay";
SlashCmdList["GUILDNOTEDISPLAY"] = function(msg)
	app.OpenSettings()
end

-- Normalize special characters
function app.NormalizeSpecialCharacters(str)
	local substitutes = {}
	substitutes["À"] = "A"
	substitutes["Á"] = "A"
	substitutes["Â"] = "A"
	substitutes["Ã"] = "A"
	substitutes["Ä"] = "A"
	substitutes["Å"] = "A"
	substitutes["Æ"] = "AE"
	substitutes["Ç"] = "C"
	substitutes["È"] = "E"
	substitutes["É"] = "E"
	substitutes["Ê"] = "E"
	substitutes["Ë"] = "E"
	substitutes["Ì"] = "I"
	substitutes["Í"] = "I"
	substitutes["Î"] = "I"
	substitutes["Ï"] = "I"
	substitutes["Ð"] = "D"
	substitutes["Ñ"] = "N"
	substitutes["Ò"] = "O"
	substitutes["Ó"] = "O"
	substitutes["Ô"] = "O"
	substitutes["Õ"] = "O"
	substitutes["Ö"] = "O"
	substitutes["Ø"] = "O"
	substitutes["Ù"] = "U"
	substitutes["Ú"] = "U"
	substitutes["Û"] = "U"
	substitutes["Ü"] = "U"
	substitutes["Ý"] = "Y"
	substitutes["Þ"] = "P"
	substitutes["ß"] = "s"
	substitutes["à"] = "a"
	substitutes["á"] = "a"
	substitutes["â"] = "a"
	substitutes["ã"] = "a"
	substitutes["ä"] = "a"
	substitutes["å"] = "a"
	substitutes["æ"] = "ae"
	substitutes["ç"] = "c"
	substitutes["è"] = "e"
	substitutes["é"] = "e"
	substitutes["ê"] = "e"
	substitutes["ë"] = "e"
	substitutes["ì"] = "i"
	substitutes["í"] = "i"
	substitutes["î"] = "i"
	substitutes["ï"] = "i"
	substitutes["ð"] = "eth"
	substitutes["ñ"] = "n"
	substitutes["ò"] = "o"
	substitutes["ó"] = "o"
	substitutes["ô"] = "o"
	substitutes["õ"] = "o"
	substitutes["ö"] = "o"
	substitutes["ø"] = "o"
	substitutes["ù"] = "u"
	substitutes["ú"] = "u"
	substitutes["û"] = "u"
	substitutes["ü"] = "u"
	substitutes["ý"] = "y"
	substitutes["þ"] = "p"
	substitutes["ÿ"] = "y"

	local normalisedString = ''

	local normalisedString = str: gsub("[%z\1-\127\194-\244][\128-\191]*", substitutes)

	return normalisedString
end  

-- Normalises the guild note and compares it to the short name
function app.NormalizeAndCompare(guildNote, shortName)
    if GuildNoteDisplayDB["normalise_special_characters"] then
        guildNote = app.NormalizeSpecialCharacters(guildNote)
        shortName = app.NormalizeSpecialCharacters(shortName)
    end
	return guildNote, shortName, guildNote and string.lower(shortName) ~= string.lower(guildNote)
end

-- Gets the guild note for a player by looping over the number of guild members
function app.FindGuildNoteForPlayer(nameWithRealm, useOfficerNote)
    for i = 1, GetNumGuildMembers() do
        local name, _, _, _, _, _, publicNote, officerNote = GetGuildRosterInfo(i)
        if name == nameWithRealm and not useOfficerNote then
            return publicNote
		elseif name == nameWithRealm and useOfficerNote then
			return officerNote 
        end
    end
end

-- Formats the message with the guild note
function app.FormatMessageWithGuildNote(msg, author, guildNote)
    local textColor = CreateColor(GuildNoteDisplayDB.note_colour_table.r, GuildNoteDisplayDB.note_colour_table.g, GuildNoteDisplayDB.note_colour_table.b, GuildNoteDisplayDB.note_colour_table.a)
    if not GuildNoteDisplayDB["note_in_author_field"] then
        if GuildNoteDisplayDB["colour_guild_note"] then
            msg = "|c" .. textColor:GenerateHexColor() .. "(" .. guildNote .. ")|r " .. msg
        else
            msg = "(" .. guildNote .. ") " .. msg
        end
    else
        author = Ambiguate(author, "guild") .. " (" .. guildNote .. ")"
    end
    return msg, author
end

-- Adds the guild note to the guild chat
function app.AddGuildNoteToGuildChat(self, event, msg, author, ...)
    if event == "CHAT_MSG_GUILD" or event == "CHAT_MSG_OFFICER" then
        local guildNote = app.FindGuildNoteForPlayer(author, GuildNoteDisplayDB["use_officer_note"])
        local shortName = Ambiguate(author, "short")
        local guildNoteForCompare, shortNameForCompare, isDifferent = app.NormalizeAndCompare(guildNote, shortName)

        if guildNote and guildNote ~= "" and isDifferent then
            msg, author = app.FormatMessageWithGuildNote(msg, author, guildNote)
        end
        return false, msg, author, ...
    end
end

-- Adds the guild note to the party and raid chat
function app.AddGuildNoteToPartyRaidChat(self, event, msg, author, ...)
    if GuildNoteDisplayDB["display_party_raid_chat"] and (event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_PARTY_LEADER" or event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER") then
        local guildNote = app.FindGuildNoteForPlayer(author, GuildNoteDisplayDB["use_officer_note"])
        local shortName = Ambiguate(author, "short")
        local guildNoteForCompare, shortNameForCompare, isDifferent = app.NormalizeAndCompare(guildNote, shortName)

        if guildNote and guildNote ~= "" and isDifferent then
            msg, author = app.FormatMessageWithGuildNote(msg, author, guildNote)
        end
        return false, msg, author, ...
    end
end

-- Adds the guild note to the login and logout message
function app.AddGuildNoteToLoginLogoutMessage(self, event, msg, ...)
    if event == "CHAT_MSG_SYSTEM" then
		-- Get the name from the login or logout message
		local subbedMessage = ERR_FRIEND_ONLINE_SS:gsub("%%s", "(%.+)"):gsub("%[", "%%["):gsub("%]","%%]")
		local author = string.match(msg, subbedMessage)
		if author == nil then
			subbedMessage = ERR_FRIEND_OFFLINE_S:gsub("%%s", "(%.+)"):gsub("%[", "%%["):gsub("%]","%%]")
			author = string.match(msg, subbedMessage)
		end

		if author ~= nil then
			-- Author needs the realm name added to it
			if not strfind(author, "-") then
				author = author .. "-" .. GetNormalizedRealmName()
			end

			local guildNote = app.FindGuildNoteForPlayer(author, GuildNoteDisplayDB["use_officer_note"])
			local shortName = Ambiguate(author, "short")
			local guildNoteForCompare, shortNameForCompare, isDifferent = app.NormalizeAndCompare(guildNote, shortName)

			if guildNote and guildNote ~= "" and isDifferent then
				msg = app.FormatMessageWithGuildNote(msg, author, guildNote)
			end
			return false, msg, ...
		end
    end
end

-- Add message event filters
function app.AddMessageEventFilters()
	-- Add the event filter for the guild chat messages
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", app.AddGuildNoteToGuildChat)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", app.AddGuildNoteToGuildChat)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", app.AddGuildNoteToLoginLogoutMessage)
	if GuildNoteDisplayDB["display_party_raid_chat"] ~= nil and GuildNoteDisplayDB["display_party_raid_chat"] then
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", app.AddGuildNoteToPartyRaidChat)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", app.AddGuildNoteToPartyRaidChat)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", app.AddGuildNoteToPartyRaidChat)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", app.AddGuildNoteToPartyRaidChat)
	end
end

-- Settings
function app.Settings()
	-- Settings page
	local category, layout = Settings.RegisterVerticalLayoutCategory(app.Name)
	Settings.RegisterAddOnCategory(category)
	app.Category = category

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(C_AddOns.GetAddOnMetadata(appName, "Version")))

	local CreateCheckbox = Settings.CreateCheckbox or Settings.CreateCheckBox

	local function OnSettingChanged(_, setting, value)
		local variable = setting:GetVariable()

		if strsub(variable, 1, 17) == "GuildNoteDisplay_" then
			variable = strsub(variable, 17);
		end
	end

	local function RegisterSetting(variableKey, defaultValue, name)
		local uniqueVariable = "GuildNoteDisplay_" .. variableKey;

		local setting;
		setting = Settings.RegisterAddOnSetting(category, uniqueVariable, variableKey, GuildNoteDisplayDB, type(defaultValue), name, defaultValue);

		setting:SetValue(GuildNoteDisplayDB[variableKey]);
		Settings.SetOnValueChangedCallback(uniqueVariable, OnSettingChanged);

		return setting;
	end

	do -- checkbox
		local variable = "colour_guild_note"
		local name = L["Colour guild note"]
		local tooltip = L["Colour guild note tooltip"]
		local defaultValue = true

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

    do -- color picker
        local function OnButtonClick()
            app.ShowColorPicker(GuildNoteDisplayDB.note_colour_table)
        end

        local initializer = CreateSettingsButtonInitializer(L["Guild note colour"], L["Click to pick a colour"], OnButtonClick, nil, true);
        layout:AddInitializer(initializer)
    end

	do -- checkbox
		local variable = "note_in_author_field"
		local name = L["Note in name field"]
		local tooltip = L["Note in name field tooltip"]
		local defaultValue = false

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

	do -- checkbox
		local variable = "normalise_special_characters"
		local name = L["Normalise special characters"]
		local tooltip = L["Normalise special characters tooltip"]
		local defaultValue = false

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

	do -- checkbox
		local variable = "use_officer_note"
		local name = L["Use the officer note"]
		local tooltip = L["Use the officer note tooltip"]
		local defaultValue = false

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

	do -- checkbox
		local variable = "display_party_raid_chat"
		local name = L["Display in party and raid chat"]
		local tooltip = L["Display in party and raid chat tooltip"]
		local defaultValue = true

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

	do -- checkbox
		local variable = "hide"
		local name = L["Hide minimap icon"]
		local tooltip = L["Hide minimap icon tooltip"]
		local defaultValue = false

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
		setting:SetValueChangedCallback(function()
			if GuildNoteDisplayDB["hide"] == false then
				app.MinimapIcon:Show(appName)
			else
				app.MinimapIcon:Hide(appName)
			end
		end)
	end
end