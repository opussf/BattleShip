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
	SLASH_SEABATTLE1 = "/SeaBattle"
	SLASH_SEABATTLE2 = "/SB"
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

	SB.Print("Loaded")
	SB_Frame:UnregisterEvent("ADDON_LOADED")
end
function SB.GUILD_ROSTER_UPDATE( whatAmI )
end
function SB.CHAT_MSG_ADDON( prefix, message, distribution, sender )
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
			SLASH_SEABATTLE2, cmd, info.help[1], info.help[2]));
	end
end
SB.CommandList = {
	["help"] = {
		["func"] = SB.PrintHelp,
		["help"] = {"","Print this help."},
	},
}
function SB.Command( msg )
	local cmd, param = SB.ParseCmd( msg )
	cmd = string.lower( cmd )
	local cmdFunc = SB.CommandList[cmd]
	if cmdFunc then
		cmdFunc.func( param )
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

--[[

function RF.Command(msg)
	local cmd, param = RF.ParseCmd(msg);
	cmd = string.lower(cmd);
	local cmdFunc = RF.CommandList[cmd];
	if cmdFunc then
		cmdFunc.func(param);
	else
		InterfaceOptionsFrame_OpenToCategory("Random Fortune");
		--RF.Print("Use '/rf help' for a list of commands.");
	end
end






RF.CommandList = {
	["help"] = {
		["func"] = RF.PrintHelp,
		["help"] = {"","Print this help."},
	},
}
function SB.Command( msg )
	local cmd, param = INEED.parseCmd(msg);
	--INEED.Print("cl:"..cmd.." p:"..(param or "nil") )
	local cmdFunc = INEED.CommandList[cmd];
	if cmdFunc then
		cmdFunc.func(param);
	elseif ( cmd and cmd ~= "") then  -- exists and not empty
		--INEED.Print("cl:"..cmd.." p:"..(param or "nil"))
		--param, targetString = INEED.parseTarget( param )
		INEED.addItem( cmd, tonumber(param) )
		INEED.makeOthersNeed()
		--
		--if targetString then
		--	INEED.addTarget( cmd, tonumber(param), targetString )
		--end
		--InterfaceOptionsFrame_OpenToCategory(FB_MSG_ADDONNAME);
	else
		INEED.PrintHelp()
	end
end
]]
--[[
function GoldRate.GuildPrint( msg )
	if (IsInGuild()) then
		guildName, guildRankName, guildRankIndex = GetGuildInfo("player")

		GoldRate.Print(GoldRate.realm.."-"..guildName)
		SendChatMessage( msg, "GUILD" )
	end
	--if (IsInGuild() and RF_options.guild) then
	--	SendChatMessage( msg, "GUILD" );
--	else
--		RF.Print( COLOR_RED.."RF.GuildPrint: "..COLOR_END..msg, false );
	--end
end
function GoldRate.OnLoad()
	SLASH_GOLDRATE1 = "/GR"
	SLASH_GOLDRATE2 = "/GoldRate"
	SlashCmdList["GOLDRATE"] = function(msg) GoldRate.Command(msg); end

	GoldRate_Frame:RegisterEvent("ADDON_LOADED")
	GoldRate_Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	GoldRate_Frame:RegisterEvent("PLAYER_MONEY")
	GoldRate_Frame:RegisterEvent("TOKEN_MARKET_PRICE_UPDATED")
end
]]