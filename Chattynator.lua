-- Initialisation
local appName, app = ...    -- App name and app table

-- Chattynator Hyperlink handling
function app.AddTooltipToCharacterName_Chattynator()
	local ChattynatorHyperlinkHandler = Chattynator.API.GetHyperlinkHandler()
	ChattynatorHyperlinkHandler:HookScript("OnHyperlinkEnter", function(_, hyperlink) GuildNoteDisplay.GetTooltipHandler(hyperlink, ChattynatorHyperlinkHandler) end)
	ChattynatorHyperlinkHandler:HookScript("OnHyperlinkLeave", function() GameTooltip:Hide() end)
end