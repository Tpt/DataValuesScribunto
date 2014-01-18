--[[
	@since 0.1

	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local util = require 'libraryUtil'
local checkType = util.checkType
local php

local GlobeCoordinateValue = {}
setmetatable( GlobeCoordinateValue, {
	__index = mw.dataValues.DataValue
} );

--[[
	@param mixed serialization
	@return GlobeCoordinateValue
]]--
function GlobeCoordinateValue.newFromSerialization( serialization )
	checkType( 'newFromSerialization', 1, serialization, 'table' )
	if type( serialization.latitude ) ~= 'number' then
		error( 'the serialization passed to mw.dataValues.GlobeCoordinateValue.newFromSerialization should have a "latitude" key with a numerical value', 2 )
	end
	if type( serialization.longitude ) ~= 'number' then
		error( 'the serialization passed to mw.dataValues.GlobeCoordinateValue.newFromSerialization should have a "longitude" key with a numerical value', 2 )
	end
	if serialization.precision ~= nil and type( serialization.precision ) ~= 'number' then
		error( 'the "precision" key passed to mw.dataValues.GlobeCoordinateValue.newFromSerialization should have numerical value', 2 )
	end
	if serialization.globe == nil then
		serialization.globe = GlobeCoordinateValue.GLOBE.EARTH
	else
		if not inArray( serialization.globe, GlobeCoordinateValue.GLOBE ) then
			error( 'the "globle" key passed to mw.dataValues.GlobeCoordinateValue.newFromSerialization should have a valid globe id as value', 2 )
		end
	end

	local dataValue = {
		_value = serialization
	}

	setmetatable( dataValue, {
		__index = GlobeCoordinateValue
	} )

	return dataValue
end

--[[
	@param string string
	@return GlobeCoordinateValue
]]--
function GlobeCoordinateValue.newFromString( string )
	checkType( 'newFromString', 1, string, 'string' )

	return GlobeCoordinateValue.newFromSerialization( php.newFromString( string ) )
end

--[[
	@return number
]]--
function GlobeCoordinateValue:getLatitude()
	return self._value.latitude
end

--[[
	@return number
]]--
function GlobeCoordinateValue:getLongitude()
	return self._value.longitude
end

--[[
	@todo guess precision?
	@return number|nil
]]--
function GlobeCoordinateValue:getPrecision()
	return self._value.precision or nil
end


--[[
	@return GlobeCoordinateValue.GLOBE constant
]]--
function GlobeCoordinateValue:getGlobe()
	return self._value.globe
end

--[[
	@return string
]]--
function GlobeCoordinateValue:toString()
	return php.toString( self._value )
end

--[[
	@return string
]]--
function GlobeCoordinateValue.getType()
	return 'globecoordinate'
end

GlobeCoordinateValue.GLOBE = {
	EARTH = 'http://www.wikidata.org/entity/Q2'
}

--[[
	@param mixed element
	@param mixed[] array
	@return boolean
]]--
function inArray( element, array )
	for _,elem in pairs( array ) do
		if elem == element then
			return true
		end
	end
	return false
end


function GlobeCoordinateValue.setupInterface()
	-- Boilerplate
	GlobeCoordinateValue.setupInterface = nil
	php = mw_interface
	mw_interface = nil

	-- Register this library in the "mw" global
	mw.dataValues.GlobeCoordinateValue = GlobeCoordinateValue
	package.loaded['mw.dataValues.GlobeCoordinateValue'] = GlobeCoordinateValue
end

return GlobeCoordinateValue