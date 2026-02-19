local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "frFR" then
    L["Guild note colour"] = "Couleur de la note de guilde";
    L["Click to pick a colour"] = "Cliquez pour choisir une couleur";
    L["Colour guild note"] = "Colorer la note de guilde";
    L["Note in name field"] = "Note dans le champ de nom";
    L["Use the officer note"] = "Utiliser la note d'officier";
    L["Display in party and raid chat"] = "Afficher dans le chat de groupe et de raid";
    L["Normalise special characters"] = "Normaliser les caractères spéciaux";
    L["Colour guild note tooltip"] = "Appliquez la couleur choisie avec le paramètre 'couleur de la note de guilde' à la note de guilde dans les messages de chat.";
    L["Note in name field tooltip"] = "Cela affichera la note entre crochets après le nom du personnage, plutôt qu'au début du message.|n|n|cFFFF0000Avertissement important : Si vous cliquez sur le nom du personnage pour chuchoter, la note sera placée dans le chuchotement. C'est un effet secondaire ennuyeux que je ne peux pas contourner, et c'est pourquoi cette option n'est pas la valeur par défaut. En utilisant cette option, vous acceptez de vivre avec cet effet secondaire.|r";
    L["Use the officer note tooltip"] = "Utilisez la note d'officier plutôt que la note publique pour l'affichage de la note de guilde. |cFFFF0000Vous devez être en mesure de voir les notes d'officier pour que ce paramètre fonctionne correctement !|r";
    L["Display in party and raid chat tooltip"] = "Affichez la note de guilde dans le chat de groupe et de raid. Cela ne fonctionnera évidemment que pour les personnages avec lesquels vous partagez une guilde.";
    L["Normalise special characters tooltip"] = "Lors de la comparaison des noms, normalisez les caractères spéciaux comme les accents sur leurs caractères de base. Cela peut aider à faire correspondre des noms qui peuvent avoir des orthographes ou des diacritiques différents.";
    L["Hide minimap icon"] = "Masquer l'icône de la minicarte";
    L["Hide minimap icon tooltip"] = "Masquez l'icône de la minicarte pour cet addon. Vous pouvez toujours accéder aux paramètres en tapant /gnd ou en utilisant le compartiment d'addon.";
end