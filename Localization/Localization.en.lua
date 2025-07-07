local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "enUS" then
    L["Guild note colour"] = "Guild note colour";
    L["Click to pick a colour"] = "Click to pick a colour";
    L["Colour guild note"] = "Colour guild note";
    L["Note in name field"] = "Note in name field";
    L["Use the officer note"] = "Use the officer note";
    L["Display in party and raid chat"] = "Display in party and raid chat";
    L["Normalise special characters"] = "Normalise special characters";
    L["Colour guild note tooltip"] = "Apply the colour chosen with the 'guild note colour' setting to the guild note in the chat messages.";
    L["Note in name field tooltip"] = "This will show the note in brackets after the character name, rather than at the start of the message.|n|n|cFFFF0000Important warning: If you click the name of the character to whisper, the note will be placed in the whisper. This is an annoying side effect I cannot work around, and why this option is not the default. By using this option, you agree to live with this side effect.|r";
    L["Use the officer note tooltip"] = "Use the officer note rather than the public note for the guild note display. |cFFFF0000Must be able to see officer notes for this setting to work correctly!|r";
    L["Display in party and raid chat tooltip"] = "Display the guild note in party and raid chat. This will obviously only work for characters that you share a guild with.";
    L["Normalise special characters tooltip"] = "When comparing names, normalise special characters like accents to their base characters. This can help with matching names that may have different spellings or diacritics.";
end