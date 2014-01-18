--[[
	@since 0.1

	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local util = require 'libraryUtil'
local checkType = util.checkType

local StringValue = {}
setmetatable( StringValue, {
	__index = mw.dataValues.DataValue
} );

--[[
	@param mixed serialization
	@return StringValue
]]--
function StringValue.newFromSerialization( serialization )
	checkType( 'newFromSerialization', 1, serialization, 'string' )

	local dataValue = {
		_value = serialization
	}

	setmetatable( dataValue, {
		__index = StringValue
	} )

	return dataValue
end

--[[
	@param string string
	@return StringValue
]]--
function StringValue.newFromString( string )
	checkType( 'newFromString', 1, string, 'string' )

	return StringValue.newFromSerialization( string )
end

--[[
	@return string
]]--
function StringValue:toString()
	return self._value
end

--[[
	@return string
]]--
function StringValue.getType()
	return 'string'
end

function StringValue.setupInterface()
	-- Boilerplate
	StringValue.setupInterface = nil
	mw_interface = nil

	-- Register this library in the "mw" global
	mw.dataValues.StringValue = StringValue
	package.loaded['mw.dataValues.StringValue'] = StringValue
end

return StringValue