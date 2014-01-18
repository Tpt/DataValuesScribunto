--[[
	@since 0.1

	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local DataValue = {}

--[[
	@param mixed serialization
	@return DataValue
]]--
function DataValue.newFromSerialization( serialization )
	return error( 'the newFromSerialization method is not implemented' )
end

--[[
	@return string
]]--
function DataValue:toString()
	return error( 'the toString method is not implemented' )
end

--[[
	@return string
]]--
function DataValue.getType()
	return error( 'the getType method is not implemented' )
end


function DataValue.setupInterface()
	-- Boilerplate
	DataValue.setupInterface = nil
	mw_interface = nil

	-- Register this library in the "mw" global
	mw.dataValues.DataValue = DataValue
	package.loaded['mw.dataValues.DataValue'] = DataValue
end

return DataValue