<?php

namespace DataValues\Scribunto\Lua;

use DataValues\GlobeCoordinateValue;
use DataValues\LatLongValue;
use Scribunto_LuaLibraryBase;
use ValueFormatters\FormatterOptions;
use ValueFormatters\GlobeCoordinateFormatter;
use ValueParsers\GlobeCoordinateParser;
use ValueParsers\ParserOptions;

/**
 * @since 0.1
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class GlobeCoordinateValueLibrary extends Scribunto_LuaLibraryBase {

	public function register() {
		$this->getEngine()->registerInterface(
			__DIR__ . '/mw.dataValues.GlobeCoordinateValue.lua',
			array(
				'newFromString' => array( $this, 'newFromString' ),
				'toString' => array( $this, 'toString' )
			),
			array()
		);
	}

	/**
	 * @param string $string
	 * @return array
	 */
	public function newFromString( $string ) {
		$parser = new GlobeCoordinateParser( new ParserOptions() );
		$dataValue = $parser->parse( $string );
		return array( $this->getSerializationFromDataValue( $dataValue ) );
	}

	/**
	 * @param mixed $serialization
	 * @return array
	 */
	public function toString( $serialization ) {
		$dataValue = $this->getDataValueFromSerialization( $serialization );
		$formatter = new GlobeCoordinateFormatter( new FormatterOptions() );

		return array( $formatter->format( $dataValue ) );
	}

	/**
	 * @param mixed $serialization
	 * @return GlobeCoordinateValue
	 */
	private function getDataValueFromSerialization( $serialization ) {
		return new GlobeCoordinateValue(
			new LatLongValue( $serialization['latitude'], $serialization['longitude'] ),
			array_key_exists( 'precision', $serialization ) ? $serialization['precision'] : null,
			$serialization['globe']
		);
	}

	/**
	 * @param GlobeCoordinateValue $dataValue
	 * @return mixed
	 */
	private function getSerializationFromDataValue( GlobeCoordinateValue $dataValue ) {
		return array(
			'latitude' => $dataValue->getLatitude(),
			'longitude' => $dataValue->getLongitude(),
			'precision' => $dataValue->getPrecision(),
			'globe' => $dataValue->getGlobe()
		);
	}
}