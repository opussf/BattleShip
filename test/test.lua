#!/usr/bin/env lua

addonData = { ["Version"] = "1.0",
}

require "wowTest"

test.outFileName = "testOut.xml"


-- require the file to test
package.path = "../src/?.lua;'" .. package.path
require "BattleShip"


function test.before()
end
function test.after()
end

test.run()
