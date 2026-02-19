local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "koKR" then
    L["Guild note colour"] = "길드 메모 색상";
    L["Click to pick a colour"] = "색상을 선택하려면 클릭하세요";
    L["Colour guild note"] = "길드 메모 색상";
    L["Note in name field"] = "이름 필드에 메모";
    L["Use the officer note"] = "임원 메모 사용";
    L["Display in party and raid chat"] = "파티 및 공격대 채팅에 표시";
    L["Normalise special characters"] = "정규화 특수 문자";
    L["Colour guild note tooltip"] = "'길드 메모 색상' 설정으로 선택한 색상을 채팅 메시지의 길드 메모에 적용합니다.";
    L["Note in name field tooltip"] = "이것은 메시지의 시작 부분이 아니라 캐릭터 이름 뒤에 괄호로 메모를 표시합니다.|n|n|cFFFF0000중요 경고: 캐릭터 이름을 클릭하여 귓속말을 보내면 메모가 귓속말에 삽입됩니다. 이것은 내가 우회할 수 없는 성가신 부작용이며, 이 옵션이 기본값이 아닌 이유입니다. 이 옵션을 사용함으로써 이 부작용과 함께 살기로 동의하는 것입니다.|r";
    L["Use the officer note tooltip"] = "길드 메모 표시를 위해 공개 메모 대신 임원 메모를 사용합니다. |cFFFF0000이 설정이 올바르게 작동하려면 임원 메모를 볼 수 있어야 합니다!|r";
    L["Display in party and raid chat tooltip"] = "파티 및 공격대 채팅에 길드 메모를 표시합니다. 이것은 당신이 길드를 공유하는 캐릭터에 대해서만 작동합니다.";
    L["Normalise special characters tooltip"] = "이름을 비교할 때, 악센트와 같은 특수 문자를 기본 문자로 정규화합니다. 이는 서로 다른 철자나 발음 기호가 있는 이름을 일치시키는 데 도움이 될 수 있습니다.";
    L["Hide minimap icon"] = "미니맵 아이콘 숨기기";
    L["Hide minimap icon tooltip"] = "이 애드온의 미니맵 아이콘을 숨깁니다. /gnd를 입력하거나 애드온 구획을 사용하여 설정에 여전히 액세스할 수 있습니다.";
end