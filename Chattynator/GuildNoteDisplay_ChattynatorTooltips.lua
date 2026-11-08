-- Initialisation
local appName, app = ...    -- App name and app table

-- Event registration
local event = CreateFrame("Frame")
event:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		self[event](self, ...)
	end
end)
event:RegisterEvent("ADDON_LOADED")

-- Addon is loaded
function event:ADDON_LOADED(addOnName, containsBindings)
	if addOnName == appName then
		app.AddTooltipToCharacterName_Chattynator()
	end
end

-- Chattynator Hyperlink handling
function app.AddTooltipToCharacterName_Chattynator()
	local ChattynatorHyperlinkHandler = Chattynator.API.GetHyperlinkHandler()
	ChattynatorHyperlinkHandler:HookScript("OnHyperlinkEnter", function(_, hyperlink) GuildNoteDisplay.GetTooltipHandler(hyperlink, ChattynatorHyperlinkHandler) end)
	ChattynatorHyperlinkHandler:HookScript("OnHyperlinkLeave", function() GameTooltip:Hide() end)
end
