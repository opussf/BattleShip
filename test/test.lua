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
SB.name = "testName"
SB.realm = "testRealm"
SB.faction = "Alliance"

function test.before()
	SB.OnLoad()
end
function test.after()
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


test.run()
