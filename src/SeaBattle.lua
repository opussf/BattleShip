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
SB_Data = {}
SB_Options = {}

function SB.OnLoad()
	SLASH_SEABATTLE1 = "/SeaBattle"
	SLASH_SEABATTLE2 = "/SB"
	SlashCmdList["SEABATTLE"] = function( msg ) SB.Command( msg ); end

	SB_Frame:RegisterEvent("ADDON_LOADED")
end
function SB.ADDON_LOADED()
end
function SB.Command( msg )
end
--[[
function GoldRate.Print( msg, showName)
	-- print to the chat frame
	-- set showName to false to suppress the addon name printing
	if (showName == nil) or (showName) then
		msg = COLOR_PURPLE..GOLDRATE_MSG_ADDONNAME.."> "..COLOR_END..msg
	end
	DEFAULT_CHAT_FRAME:AddMessage( msg )
end
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