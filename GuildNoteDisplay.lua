-- Initialisation
local appName, app = ...    -- App name and app table
app.api = {}    -- Api table for our app
GuildNoteDisplay = app.api  -- Api namespace
local api = app.api -- Api prefix for easier access
app.Name = "Guild Note Display"

-- Event registration
local event = CreateFrame("Frame")
event:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		self[event](self, ...)
	end
end)
event:RegisterEvent("ADDON_LOADED")

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
end

-- Addon is loaded
function event:ADDON_LOADED(addOnName, containsBindings)
	if addOnName == appName then
        app.Initialise()
        app.Settings()
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

-- Gets the public note for a player by looping over the number of guild members
function app.FindPublicNoteForPlayer(nameWithRealm)
    for i = 1, GetNumGuildMembers() do
        local name, _, _, _, _, _, publicNote = GetGuildRosterInfo(i)
        if name == nameWithRealm then
            return publicNote
        end
    end
end

-- Adds the public note to the guild chat
function app.AddGuildNoteToGuildChat(self, event, msg, author, ...)
    if event == "CHAT_MSG_GUILD" then
        local publicNote = app.FindPublicNoteForPlayer(author)
        local shortName = Ambiguate(author, "short")
		local publicNoteForCompare = publicNote
		local shortNameForCompare = shortName

		if GuildNoteDisplayDB["normalise_special_characters"] then
			publicNoteForCompare = app.NormalizeSpecialCharacters(publicNote)
			shortNameForCompare = app.NormalizeSpecialCharacters(shortName)
		end

        if publicNote and publicNote ~= "" and string.lower(shortNameForCompare) ~= string.lower(publicNoteForCompare) then
            local textColor = CreateColor(GuildNoteDisplayDB.note_colour_table.r, GuildNoteDisplayDB.note_colour_table.g, GuildNoteDisplayDB.note_colour_table.b, GuildNoteDisplayDB.note_colour_table.a);
			if not GuildNoteDisplayDB["note_in_author_field"] then
				if GuildNoteDisplayDB["colour_guild_note"] then
					msg = "|c" .. textColor:GenerateHexColor() .. "(" .. publicNote .. ")|r " .. msg
				else
					msg = "(" .. publicNote .. ") " .. msg				
				end				
			else
				 -- INFO: Author is in the format of name-realm but in guild this would normally show as name only when on the same realm so we need to ambiguate it
            	author = Ambiguate(author, "guild") .. " (" .. publicNote .. ")"
			end          
        end
        return false, msg, author, ...
    end
end

-- Add the event filter
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", app.AddGuildNoteToGuildChat)

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
		local name = "Colour guild note"
		local tooltip = "Apply the colour chosen with the 'guild note colour' setting to the guild note in the chat messages"
		local defaultValue = true

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

    do -- color picker
        local function OnButtonClick()
            app.ShowColorPicker(GuildNoteDisplayDB.note_colour_table)
        end

        local initializer = CreateSettingsButtonInitializer("Guild note colour", "Click to pick a colour", OnButtonClick, nil, true);
        layout:AddInitializer(initializer);
    end

	do -- checkbox
		local variable = "note_in_author_field"
		local name = "Note in name field"
		local tooltip = "This will show the note in brackets after the character name, rather than at the start of the message.|n|n|cFFFF0000Important warning: If you click the name of the character to whisper, the note will be placed in the whisper. This is an annoying side effect I cannot work around, and why this option is not the default. By using this option, you agree to live with this side effect.|r"
		local defaultValue = false

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end

	do -- checkbox
		local variable = "normalise_special_characters"
		local name = "Normalise special characters"
		local tooltip = "When comparing names, normalise special characters like accents to their base characters. This is useful if your guild uses special characters in names, but you want to compare them to the normal characters. Normalisation will be applied to both the guild note and the character name."
		local defaultValue = false

		local setting = RegisterSetting(variable, defaultValue, name)
		CreateCheckbox(category, setting, tooltip)
	end
end