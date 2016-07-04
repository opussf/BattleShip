#!/usr/bin/env lua

addonData = { ["Version"] = "1.0",
}

require "wowTest"

test.outFileName = "testOut.xml"

SB_Frame = CreateFrame()

-- require the file to test
package.path = "../src/?.lua;'" .. package.path
require "SeaBattle"

-- addon setup
SB.name = "testPlayer"
SB.realm = "testRealm"
SB.faction = "Alliance"

function test.before()
	SB.OnLoad()
	SB.ADDON_LOADED()
end
function test.after()
	SB_Data = {}
end
function test.test_HasSB_Data()
	assertTrue( SB_Data )
end
function test.test_HasSB_Options()
	assertTrue( SB_Options )
end
function test.test_HasSlashCommand()
	assertTrue( SLASH_SEABATTLE1 )
end
function test.test_HasSlashCommand2()
	assertTrue( SLASH_SEABATTLE2 )
end
function test.test_HasCommandFunctionListed()
	assertTrue( SlashCmdList["SEABATTLE"] )
end
function test.test_HasCommand()
	SB.Command("")
end
function test.test_HasCommandHelp()
	SB.Command("help")
end
function test.test_Command_New_NoOtherPlayers()
	SB.Command("new")
end
function test.test_RegisterSelf()
	assertTrue( SB_Data )
	assertTrue( SB_Data.Players["testPlayer-testRealm"] )
end
function test.test_Event_GUILD_ROSTER_UPDATE_true()
	SB.GUILD_ROSTER_UPDATE( true )
end
function test.test_Event_GUILD_ROSTER_UPDATE_false()
	SB.GUILD_ROSTER_UPDATE( false )
end
function test.test_Event_CHAT_MSG_ADDON()
	SB.CHAT_MSG_ADDON( prefix, message, distribution, sender )
end
function test.test_ShowPossibleNewOpponent_NoOpponentsKnown()
	assertIsNil( SB.Command("new") )
end
function test.test_ShowPossibleNewOpponent_ThisRealm()
	SB_Data.Players["otherPlayer-testRealm"]= {}
	assertEquals( "otherPlayer-testRealm", SB.Command("new")[1] )
end
function test.test_ShowPossibleNewOpponent_ThisRealm_HasGame()
	SB_Data.Players["otherPlayer-testRealm"] = { ["game"]={} }
	assertIsNil( SB.Command("new") )
end
function test.test_StartAGame_ValidPlayer()
	SB_Data.Players["otherPlayer-testRealm"]= {}
	assertEquals( "otherPlayer-testRealm", SB.Command( "new otherPlayer-testRealm" ) )
end
function test.test_StartAGame_InvalidPlayer_nonExistant()
	assertIsNil( SB.Command( "new otherPlayer-testRealm" ) )
end
function test.test_StartAGame_InvalidPlayer_hasGame()
	SB_Data.Players["otherPlayer-testRealm"] = { ["game"]={} }
	assertIsNil( SB.Command( "new otherPlayer-testRealm" ) )
end

test.run()
