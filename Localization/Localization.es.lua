local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "esES" then
    L["Guild note colour"] = "Color de nota de la guilda";
    L["Click to pick a colour"] = "Haz clic para elegir un color";
    L["Colour guild note"] = "Colorear nota de la guilda";
    L["Note in name field"] = "Nota en el campo de nombre";
    L["Use the officer note"] = "Usar la nota de oficial";
    L["Display in party and raid chat"] = "Mostrar en el chat de grupo y banda";
    L["Normalise special characters"] = "Normalizar caracteres especiales";
    L["Colour guild note tooltip"] = "Aplica el color elegido con la configuración 'color de nota de la guilda' a la nota de la guilda en los mensajes de chat.";
    L["Note in name field tooltip"] = "Esto mostrará la nota entre corchetes después del nombre del personaje, en lugar de al principio del mensaje.|n|n|cFFFF0000Advertencia importante: Si haces clic en el nombre del personaje para susurrar, la nota se colocará en el susurro. Este es un molesto efecto secundario que no puedo evitar, y por qué esta opción no es la predeterminada. Al usar esta opción, aceptas vivir con este efecto secundario.|r";
    L["Use the officer note tooltip"] = "Usa la nota de oficial en lugar de la nota pública para la visualización de la nota de la guilda. |cFFFF0000¡Debes poder ver las notas de oficial para que esta configuración funcione correctamente!|r";
    L["Display in party and raid chat tooltip"] = "Muestra la nota de la guilda en el chat de grupo y banda. Esto, obviamente, solo funcionará para personajes con los que compartas una guilda.";
    L["Normalise special characters tooltip"] = "Al comparar nombres, normaliza caracteres especiales como acentos a sus caracteres base. Esto puede ayudar a hacer coincidir nombres que pueden tener diferentes ortografías o diacríticos.";
end