<?php

namespace DataValues\Scribunto\Lua;

use Scribunto_LuaEngineTestBase;

/**
 * @covers DataValues\Scribunto\Lua\StringValueLibrary
 *
 * @group DataValuesScribunto
 *
 * @licence GNU GPL v2+
 * @author Thomas Pellissier Tanon
 */
class StringValueLibraryTest extends Scribunto_LuaEngineTestBase {
	protected static $moduleName = 'StringValueTest';

	function getTestModules() {
		return parent::getTestModules() + array(
			'StringValueTest' => __DIR__ . '/StringValueTest.lua',
		);
	}
}