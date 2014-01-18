<?php

namespace DataValues\Scribunto;


/**
 * @since 0.1
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class Hooks {

	public static function onScribuntoExternalLibraries( $engine, array &$extraLibraries ) {
		if ( $engine === 'lua' ) {
			$extraLibraries['mw.dataValues'] = 'DataValues\Scribunto\Lua\DataValuesLibrary';
			$extraLibraries['mw.dataValues.DataValue'] = 'DataValues\Scribunto\Lua\DataValueLibrary';
			$extraLibraries['mw.dataValues.StringValue'] = 'DataValues\Scribunto\Lua\StringValueLibrary';
			$extraLibraries['mw.dataValues.GlobeCoordinateValue'] = 'DataValues\Scribunto\Lua\GlobeCoordinateValueLibrary';
		}

		return true;
	}
}