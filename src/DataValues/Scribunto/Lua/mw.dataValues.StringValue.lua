--[[
	@since 0.1

	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local util = require 'libraryUtil'
local checkType = util.checkType

local StringValue = {
	__index = mw.dataValues.DataValue
}

--[[
	@param table serialization
	@return StringValue
]]--
function StringValue.newFromSerialization( serialization )
	checkType( 'newFromSerialization', 1, serialization, 'string' )

	local stringValue = {
		_value = serialization
	}

	setmetatable( stringValue, {
		__index = StringValue
	} )

	return stringValue
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