--[[
	@license GNU GPL v2+
	@author Thomas Pellissier Tanon
]]--

local testframework = require 'Module:TestFramework'

function testGetLatitude( serialization )
	return mw.dataValues.GlobeCoordinateValue.newFromSerialization( serialization ):getLatitude()
end

function testGetLongitude( serialization )
	return mw.dataValues.GlobeCoordinateValue.newFromSerialization( serialization ):getLongitude()
end

function testGetPrecision( serialization )
	return mw.dataValues.GlobeCoordinateValue.newFromSerialization( serialization ):getPrecision()
end

function testGetGlobe( serialization )
	return mw.dataValues.GlobeCoordinateValue.newFromSerialization( serialization ):getGlobe()
end

function testToString( serialization )
	return mw.dataValues.GlobeCoordinateValue.newFromSerialization( serialization ):toString()
end

-- Tests
local tests = {
	{ name = 'getType', func = mw.dataValues.GlobeCoordinateValue.getType,
		args = {},
		expect = { 'globecoordinate' }
	},
	{ name = 'getLatitude', func = testGetLatitude,
		args = { { latitude = 1, longitude = -1.2 } },
		expect = { 1 }
	},
	{ name = 'getLongitude', func = testGetLongitude,
		args = { { latitude = 1, longitude = -1.2 } },
		expect = { -1.2 }
	},
	{ name = 'getPrecision', func = testGetPrecision,
		args = { { latitude = 1, longitude = -1.2, precision = 0.1 } },
		expect = { 0.1 }
	},
	{ name = 'getPrecision with nil', func = testGetPrecision,
		args = { { latitude = 1, longitude = -1.2 } },
		expect = { nil }
	},
	{ name = 'getGlobe', func = testGetGlobe,
		args = { { latitude = 1, longitude = -1.2 } },
		expect = { mw.dataValues.GlobeCoordinateValue.GLOBE.EARTH }
	},
	{ name = 'toString', func = testToString,
		args = { { latitude = 1, longitude = -1.2 } },
	 	expect = { '1, -1.2' }
	},
	{ name = 'newFromString', func = mw.dataValues.GlobeCoordinateValue.newFromString,
		args = { '1, -1.2' },
		expect = { mw.dataValues.GlobeCoordinateValue.newFromSerialization( { latitude = 1, longitude = -1.2, precision = 0.1 } ) }
	},
}

return testframework.getTestProvider( tests )