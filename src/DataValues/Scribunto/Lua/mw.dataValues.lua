--[[
	@since 0.1

	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local util = require 'libraryUtil'
local checkType = util.checkType
local dataValueClasses = {}

local dataValues = {}

--[[
	@param table serialization
	@return DataValue
]]--
function dataValues.newFromSerialization( serialization )
	checkType( 'newFromSerialization', 1, serialization, 'table' )

	if type( serialization['type'] ) ~= 'string' then
		error( 'the serialization passed to mw.dataValues.newFromSerialization should have a "type" key with a string value', 2 )
	end
	if serialization['value'] == nil then
		error( 'the serialization passed to mw.dataValues.newFromSerialization should have a "value" key', 2 )
	end
	if dataValueClasses[serialization['type']] == nil then
		error( string.format(
			'the serialization passed to mw.dataValues.newFromSerialization has as type "%s" that is not a known type',
			serialization['type']
		), 2 )
	end

	local dataValueClass = require( dataValueClasses[serialization['type']] )
	return dataValueClass.newFromSerialization( serialization['value'] )
end


function dataValues.setupInterface( options )
	-- Boilerplate
	dataValues.setupInterface = nil
	mw_interface = nil
	dataValueClasses = options.dataValueClasses

	-- Register this library in the "mw" global
	mw = mw or {}
	mw.dataValues = dataValues
	package.loaded['mw.dataValues'] = dataValues
end

return dataValues