SB_MSG_VERSION = GetAddOnMetadata("SeaBattle","Version");
SB_MSG_ADDONNAME	= "SeaBattle";
SB_MSG_AUTHOR 		= "opussf";

-- Colours
COLOR_RED = "|cffff0000";
COLOR_GREEN = "|cff00ff00";
COLOR_BLUE = "|cff0000ff";
COLOR_PURPLE = "|cff700090";
COLOR_YELLOW = "|cffffff00";
COLOR_ORANGE = "|cffff6d00";
COLOR_GREY = "|cff808080";
COLOR_GOLD = "|cffcfb52b";
COLOR_NEON_BLUE = "|cff4d4dff";
COLOR_END = "|r";

SB = {}
SB.Prefix = "SeaBattle"
SB_Data = {}
SB_Options = {}

function SB.OnLoad()
	SLASH_SEABATTLE1 = "/SB"
	SLASH_SEABATTLE2 = "/SeaBattle"
	SlashCmdList["SEABATTLE"] = function( msg ) SB.Command( msg ); end

	SB_Frame:RegisterEvent("ADDON_LOADED")
	RegisterAddonMessagePrefix( SB.Prefix )
end
function SB.ADDON_LOADED()
	SB.name = UnitName("player")
	SB.realm = GetRealmName()
	SB.faction = UnitFactionGroup("player")
	SB.nr = SB.name.."-"..SB.realm

	if not SB_Data["Players"] then
		SB_Data["Players"] = {}
	end
	SB_Data.Players[SB.nr] = {}

	--SB.Print("Loaded")
	SB_Frame:UnregisterEvent("ADDON_LOADED")
end
function SB.GUILD_ROSTER_UPDATE( whatAmI )
end
function SB.CHAT_MSG_ADDON( prefix, message, distribution, sender )
end
------------
function SB.NewGame( playerTag )

	return "Hello"
end
------------
function SB.Print( msg, showName)
	-- print to the chat frame
	-- set showName to false to suppress the addon name printing
	if (showName == nil) or (showName) then
		msg = COLOR_ORANGE..SB_MSG_ADDONNAME.."> "..COLOR_END..msg
	end
	DEFAULT_CHAT_FRAME:AddMessage( msg )
end
function SB.PrintHelp()
	SB.Print(SB_MSG_ADDONNAME.." by "..SB_MSG_AUTHOR);
	for cmd, info in pairs(SB.CommandList) do
		SB.Print(string.format("%s %s %s -> %s",
			SLASH_SEABATTLE1, cmd, info.help[1], info.help[2]));
	end
end

function SB.Command( msg )
	local cmd, param = SB.ParseCmd( msg )
	cmd = string.lower( cmd )
	local cmdFunc = SB.CommandList[cmd]
	if cmdFunc then
		return cmdFunc.func( param )
	else
		SB.CommandList.help.func()
	end
end
function SB.ParseCmd( msg )
	if msg then
		local a,b,c = strfind( msg, "(%S+)" )
		if a then
			return c, strsub( msg, b+2 )
		else
			return ""
		end
	end
end
------------
SB.CommandList = {
	["help"] = {
		["func"] = SB.PrintHelp,
		["help"] = {"","Print this help."},
	},
	["new"] = {
		["func"] = SB.NewGame,
		["help"] = {"<playerTag>","Show available players, start a new game."},
	},
}
