local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "ptBR" then
    L["Guild note colour"] = "Cor da nota da guilda";
    L["Click to pick a colour"] = "Clique para escolher uma cor";
    L["Colour guild note"] = "Colorir nota da guilda";
    L["Note in name field"] = "Nota no campo de nome";
    L["Use the officer note"] = "Usar a nota de oficial";
    L["Display in party and raid chat"] = "Exibir no chat de grupo e raid";
    L["Normalise special characters"] = "Normalizar caracteres especiais";
    L["Colour guild note tooltip"] = "Aplica a cor escolhida com a configuração 'cor da nota da guilda' à nota da guilda nas mensagens de chat.";
    L["Note in name field tooltip"] = "Isso mostrará a nota entre colchetes após o nome do personagem, em vez de no início da mensagem.|n|n|cFFFF0000Aviso importante: Se você clicar no nome do personagem para sussurrar, a nota será colocada no sussurro. Este é um efeito colateral irritante que não posso contornar, e é por isso que esta opção não é a padrão. Ao usar esta opção, você concorda em conviver com esse efeito colateral.|r";
    L["Use the officer note tooltip"] = "Usa a nota de oficial em vez da nota pública para a exibição da nota da guilda. |cFFFF0000Deve ser capaz de ver as notas de oficial para que esta configuração funcione corretamente!|r";
    L["Display in party and raid chat tooltip"] = "Exibe a nota da guilda no chat de grupo e raid. Isso, obviamente, só funcionará para personagens com os quais você compartilha uma guilda.";
    L["Normalise special characters tooltip"] = "Ao comparar nomes, normaliza caracteres especiais como acentos a seus caracteres base. Isso pode ajudar a fazer coincidir nomes que podem ter diferentes ortografias ou diacríticos.";
    L["Hide minimap icon"] = "Ocultar ícone do minimapa";
    L["Hide minimap icon tooltip"] = "Oculta o ícone do minimapa para este addon. Você ainda pode acessar as configurações digitando /gnd ou usando o compartimento de addons.";
end