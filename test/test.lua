#!/usr/bin/env lua

addonData = { ["Version"] = "1.0",
}

require "wowTest"

test.outFileName = "testOut.xml"


-- require the file to test
package.path = "../src/?.lua;'" .. package.path
require "SeaBattle"

-- addon setup
BS.name = "testName"
BS.realm = "testRealm"
BS.faction = "Alliance"

function test.before()
end
function test.after()
end
function test.Test1()
end

test.run()
