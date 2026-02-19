local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "deDE" then
    L["Guild note colour"] = "Guild notenfarbe";
    L["Click to pick a colour"] = "Klicken Sie, um eine Farbe auszuwählen";
    L["Colour guild note"] = "Färbe die Gildennotiz";
    L["Note in name field"] = "Notiz im Namensfeld";
    L["Use the officer note"] = "Verwenden Sie die Offiziersnotiz";
    L["Display in party and raid chat"] = "Im Gruppen- und Schlachtzugs-Chat anzeigen";
    L["Normalise special characters"] = "Normalisiere Sonderzeichen";
    L["Colour guild note tooltip"] = "Wenden Sie die mit der Einstellung 'Gildennotizfarbe' gewählte Farbe auf die Gildennotiz in den Chatnachrichten an.";
    L["Note in name field tooltip"] = "Dies zeigt die Notiz in Klammern nach dem Charakternamen an, anstatt am Anfang der Nachricht.|n|n|cFFFF0000Wichtiger Hinweis: Wenn Sie auf den Namen des Charakters klicken, um zu flüstern, wird die Notiz in das Flüstern eingefügt. Dies ist ein ärgerlicher Nebeneffekt, den ich nicht umgehen kann, und warum diese Option nicht die Standardoption ist. Wenn Sie diese Option verwenden, stimmen Sie zu, mit diesem Nebeneffekt zu leben.|r";
    L["Use the officer note tooltip"] = "Verwenden Sie die Offiziersnotiz anstelle der öffentlichen Notiz für die Anzeige der Gildennotiz. |cFFFF0000Muss in der Lage sein, Offiziersnotizen zu sehen, damit diese Einstellung korrekt funktioniert!|r";
    L["Display in party and raid chat tooltip"] = "Zeigt die Gildennotiz im Gruppen- und Schlachtzugs-Chat an. Dies funktioniert offensichtlich nur für Charaktere, mit denen Sie eine Gilde teilen.";
    L["Normalise special characters tooltip"] = "Bei der Namensvergleichung werden Sonderzeichen wie Akzente auf ihre Basiszeichen normalisiert. Dies kann helfen, Namen zuzuordnen, die unterschiedliche Schreibweisen oder diakritische Zeichen aufweisen.";
    L["Hide minimap icon"] = "Minikarten-Symbol ausblenden";
    L["Hide minimap icon tooltip"] = "Blendet das Minikartensymbol für dieses Addon aus. Sie können die Einstellungen weiterhin aufrufen, indem Sie /gnd eingeben oder das Addon-Fach verwenden.";
end