-- Gets the public note for a player by looping over the number of guild members
local function FindPublicNoteForPlayer(nameWithRealm)
    for i = 1, GetNumGuildMembers() do
        local name, _, _, _, _, _, publicNote = GetGuildRosterInfo(i)
        if name == nameWithRealm then
            return publicNote
        end
    end
end

local function AddGuildNoteToGuildChat(self, event, msg, author, ...)
    if event == "CHAT_MSG_GUILD" then
        local publicNote = FindPublicNoteForPlayer(author)
        local shortName = Ambiguate(author, "short")

        if publicNote and publicNote ~= "" and string.lower(shortName) ~= string.lower(publicNote) then
            -- TODO: Color picker for the note text
            msg = "|cFFFFFFFF(" .. publicNote .. ")|r " .. msg
            -- TODO: This method is going to become opt-in via a setting so we can warn about what happens when you click on the name to whipser (note is placed in the whisper)
            -- INFO: Author is in the format of name-realm but in guild this would normally show as name only when on the same realm so we need to ambiguate it
            -- author = Ambiguate(author, "guild") .. " (" .. publicNote .. ")"
        end
        return false, msg, author, ...
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", AddGuildNoteToGuildChat)