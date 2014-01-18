<?php

namespace DataValues\Scribunto\Lua;

use DataValues\GlobeCoordinateValue;
use DataValues\LatLongValue;
use Scribunto_LuaEngineTestBase;

/**
 * @covers DataValues\Scribunto\Lua\GlobeCoordinateValueLibrary
 *
 * @group DataValuesScribunto
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class GlobeCoordinateValueLibraryTest extends Scribunto_LuaEngineTestBase {
	protected static $moduleName = 'GlobeCoordinateValueTest';

	public function getTestModules() {
		return parent::getTestModules() + array(
			'GlobeCoordinateValueTest' => __DIR__ . '/GlobeCoordinateValueTest.lua',
		);
	}

	public function testNewFromString() {
		$library = new GlobeCoordinateValueLibrary( $this->getEngine() );
		$this->assertEquals(
			array( array(
				'latitude' => 1,
				'longitude' => -1.2,
				'precision' => 0.1,
				'globe' => GlobeCoordinateValue::GLOBE_EARTH
			) ),
			$library->newFromString( '1, -1.2' )
		);
	}

	public function testToString() {
		$library = new GlobeCoordinateValueLibrary( $this->getEngine() );
		$this->assertEquals(
			array( '1, -1.2' ),
			$library->toString( array(
				'latitude' => 1,
				'longitude' => -1.2,
				'precision' => 0.1,
				'globe' => GlobeCoordinateValue::GLOBE_EARTH
			) )
		);
	}
}