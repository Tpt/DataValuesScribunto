<?php

namespace DataValues\Scribunto\Lua;

use Scribunto_LuaLibraryBase;

/**
 * @since 0.1
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class DataValueLibrary extends Scribunto_LuaLibraryBase {

	public function register() {
		$this->getEngine()->registerInterface( __DIR__ . '/mw.dataValues.DataValue.lua', array(), array() );
	}
}