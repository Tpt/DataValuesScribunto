<?php

namespace DataValues\Scribunto\Lua;

use Scribunto_LuaEngineTestBase;


/**
 * @covers DataValues\Scribunto\Lua\DataValuesLibrary
 *
 * @group DataValuesScribunto
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class DataValuesLibraryTest extends Scribunto_LuaEngineTestBase {
	protected static $moduleName = 'DataValuesTest';

	function getTestModules() {
		return parent::getTestModules() + array(
			'DataValuesTest' => __DIR__ . '/DataValuesTest.lua',
		);
	}
}