--[[
	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local testframework = require 'Module:TestFramework'

function testToString( serialization )
	return mw.dataValues.StringValue.newFromSerialization( serialization ):toString()
end

function testNewFromString( string )
	return mw.dataValues.StringValue.newFromString( string ):toString()
end

-- Tests
local tests = {
	{ name = 'getType', func = mw.dataValues.StringValue.getType,
		args = {},
		expect = { 'string' }
	},
	{ name = 'toString', func = testToString,
		args = { 'test' },
	 	expect = { 'test' }
	},
	{ name = 'newFromString', func = testToString,
		args = { 'test' },
		expect = { 'test' }
	},
}

return testframework.getTestProvider( tests )