local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "itIT" then
    L["Guild note colour"] = "Colore nota di gilda";
    L["Click to pick a colour"] = "Clicca per scegliere un colore";
    L["Colour guild note"] = "Colore nota di gilda";
    L["Note in name field"] = "Nota nel campo nome";
    L["Use the officer note"] = "Usa la nota dell'ufficiale";
    L["Display in party and raid chat"] = "Mostra in chat di gruppo e raid";
    L["Normalise special characters"] = "Normalizza i caratteri speciali";
    L["Colour guild note tooltip"] = "Applica il colore scelto con l'impostazione 'colore nota di gilda' alla nota di gilda nei messaggi di chat.";
    L["Note in name field tooltip"] = "Questo mostrerà la nota tra parentesi dopo il nome del personaggio, piuttosto che all'inizio del messaggio.|n|n|cFFFF0000Avviso importante: Se fai clic sul nome del personaggio per sussurrare, la nota verrà inserita nel sussurro. Questo è un fastidioso effetto collaterale che non posso aggirare, ecco perché questa opzione non è la predefinita. Utilizzando questa opzione, accetti di convivere con questo effetto collaterale.|r";
    L["Use the officer note tooltip"] = "Usa la nota dell'ufficiale piuttosto che la nota pubblica per la visualizzazione della nota di gilda. |cFFFF0000Devi essere in grado di vedere le note dell'ufficiale affinché questa impostazione funzioni correttamente!|r";
    L["Display in party and raid chat tooltip"] = "Mostra la nota di gilda nella chat di gruppo e raid. Questo funzionerà ovviamente solo per i personaggi con cui condividi una gilda.";
    L["Normalise special characters tooltip"] = "Quando si confrontano i nomi, normalizza i caratteri speciali come gli accenti sui loro caratteri di base. Questo può aiutare a far corrispondere nomi che possono avere diverse ortografie o diacritici.";
    L["Hide minimap icon"] = "Nascondi icona minimappa";
    L["Hide minimap icon tooltip"] = "Nascondi l'icona della minimappa per questo addon. Puoi comunque accedere alle impostazioni digitando /gnd o utilizzando il compartimento degli addon.";
end