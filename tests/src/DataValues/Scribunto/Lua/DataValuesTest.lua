--[[
	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local testframework = require 'Module:TestFramework'

function testNewFromSerialization( serialization )
	return mw.dataValues.newFromSerialization( serialization ):toString()
end

function testNewFromSerializationError( serialization )
	local status, error = pcall( mw.dataValues.newFromSerialization, serialization )
	if status then
		return 'The newFromSerialization method does not fails'
	else
		return error
	end
end

-- Tests
local tests = {
	{ name = 'newFromSerialization with StringValue', func = testNewFromSerialization,
		args = { { type = 'string', value = 'test' } },
		expect = { 'test' }
	},
	{ name = 'newFromSerialization without type', func = testNewFromSerializationError,
    	args = { { value = 'test' } },
    	expect = { 'the serialization passed to mw.dataValues.newFromSerialization should have a "type" key with a string value' }
    },
    { name = 'newFromSerialization with invalid type', func = testNewFromSerializationError,
    	args = { { type = 12, value = 'test' } },
    	expect = { 'the serialization passed to mw.dataValues.newFromSerialization should have a "type" key with a string value' }
    },
    { name = 'newFromSerialization with unknown type', func = testNewFromSerializationError,
    	args = { { type = 'value', value = 'test' } },
    	expect = { 'the serialization passed to mw.dataValues.newFromSerialization has as type "value" that is not a known type' }
    },
    { name = 'newFromSerialization without value', func = testNewFromSerializationError,
        args = { { type = 'string' } },
        expect = { 'the serialization passed to mw.dataValues.newFromSerialization should have a "value" key' }
    },
}

return testframework.getTestProvider( tests )