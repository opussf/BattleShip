#!/usr/bin/env lua

addonData = { ["Version"] = "1.0",
}

require "wowTest"

test.outFileName = "testOut.xml"


-- require the file to test
package.path = "../src/?.lua;'" .. package.path
require "SeaBattle"

-- addon setup
SB.name = "testName"
SB.realm = "testRealm"
SB.faction = "Alliance"

function test.before()
end
function test.after()
end
function test.test_Test1()
	val = 1
	val = bit.lshift(val, 2)
	print(val)
end

test.run()
