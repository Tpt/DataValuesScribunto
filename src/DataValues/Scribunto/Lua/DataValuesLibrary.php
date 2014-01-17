<?php

namespace DataValues\Scribunto\Lua;

use Scribunto_LuaLibraryBase;

/**
 * @since 0.1
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class DataValuesLibrary extends Scribunto_LuaLibraryBase {

	public function register() {
		$this->getEngine()->registerInterface(
			__DIR__ . '/mw.dataValues.lua',
			array(),
			array(
				'dataValueClasses' => $this->getLuaDataValueClasses()
			)
		);
	}

	private function getLuaDataValueClasses() {
		return array(
			'string' => 'mw.dataValues.StringValue'
		);
	}
}