local appName, app = ...    -- App name and app table
local L = app.L;	-- Localisation table
if GetLocale() == "zhCN" then
    L["Guild note colour"] = "公会备注颜色";
    L["Click to pick a colour"] = "点击选择颜色";
    L["Colour guild note"] = "为公会备注上色";
    L["Note in name field"] = "在名称字段中显示备注";
    L["Use the officer note"] = "使用官员备注";
    L["Display in party and raid chat"] = "在队伍和团队聊天中显示";
    L["Normalise special characters"] = "规范化特殊字符";
    L["Colour guild note tooltip"] = "将通过“公会备注颜色”设置选择的颜色应用于聊天消息中的公会备注。";
    L["Note in name field tooltip"] = "这将在角色名称后用括号显示备注，而不是在消息的开头。|n|n|cFFFF0000重要警告：如果您单击角色名称以进行密语，则备注将放入密语中。这是一个我无法解决的烦人副作用，这就是为什么此选项不是默认值的原因。通过使用此选项，您同意与此副作用共存。|r";
    L["Use the officer note tooltip"] = "使用官员备注而不是公共备注来显示公会备注。|cFFFF0000必须能够查看官员备注才能使此设置正常工作！|r";
    L["Display in party and raid chat tooltip"] = "在队伍和团队聊天中显示公会备注。这显然只适用于您与之共享公会的角色。";
    L["Normalise special characters tooltip"] = "在比较名称时，将特殊字符（如重音符号）规范化为其基本字符。这可以帮助匹配可能具有不同拼写或变音符号的名称。";
    L["Hide minimap icon"] = "隐藏小地图图标";
    L["Hide minimap icon tooltip"] = "隐藏此插件的小地图图标。您仍然可以通过输入/gnd或使用插件区来访问设置。";
end