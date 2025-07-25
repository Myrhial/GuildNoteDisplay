local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "ruRU" then
    L["Guild note colour"] = "Цвет заметки гильдии";
    L["Click to pick a colour"] = "Нажмите, чтобы выбрать цвет";
    L["Colour guild note"] = "Цвет заметки гильдии";
    L["Note in name field"] = "Заметка в поле имени";
    L["Use the officer note"] = "Использовать заметку офицера";
    L["Display in party and raid chat"] = "Отображать в чате группы и рейда";
    L["Normalise special characters"] = "Нормализовать специальные символы";
    L["Colour guild note tooltip"] = "Применить выбранный цвет с настройкой 'цвет заметки гильдии' к заметке гильдии в сообщениях чата.";
    L["Note in name field tooltip"] = "Это покажет заметку в скобках после имени персонажа, а не в начале сообщения.|n|n|cFFFF0000Важно: если вы нажмете на имя персонажа, чтобы прошептать, заметка будет помещена в шепот. Это неприятный побочный эффект, который я не могу обойти, и именно поэтому эта опция не является значением по умолчанию. Используя эту опцию, вы соглашаетесь жить с этим побочным эффектом.|r";
    L["Use the officer note tooltip"] = "Используйте заметку офицера вместо публичной заметки для отображения заметки гильдии. |cFFFF0000Необходимо видеть заметки офицера, чтобы эта настройка работала правильно!|r";
    L["Display in party and raid chat tooltip"] = "Отображать заметку гильдии в чате группы и рейда. Это, очевидно, будет работать только для персонажей, с которыми вы делитесь гильдией.";
    L["Normalise special characters tooltip"] = "При сравнении имен нормализуйте специальные символы, такие как акценты, к их базовым символам. Это может помочь в сопоставлении имен, которые могут иметь разные написания или диакритические знаки.";
end