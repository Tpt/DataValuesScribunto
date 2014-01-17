<?php

// Include the composer autoloader if it is present.
if ( is_readable( __DIR__ . '/vendor/autoload.php' ) ) {
	include_once( __DIR__ . '/vendor/autoload.php' );
}

$wgExtensionCredits['datavalues'][] = array(
	'path' => __DIR__,
	'name' => 'DataValues Scribunto',
	'author' => array(
		'[https://www.mediawiki.org/wiki/User:Tpt Tpt]',
	),
	'descriptionmsg' => 'datavaluesscribunto-desc',
);

$dir = __DIR__ . '/';

$wgExtensionMessagesFiles['DataValuesScribunto'] = $dir . 'DataValuesScribunto.i18n.php';

$wgAutoloadClasses['DataValues\Scribunto\Hooks'] = $dir . 'src/DataValues/Scribunto/Hooks.php';
$wgAutoloadClasses['DataValues\Scribunto\Lua\DataValuesLibrary'] = $dir . 'src/DataValues/Scribunto/Lua/DataValuesLibrary.php';
$wgAutoloadClasses['DataValues\Scribunto\Lua\DataValueLibrary'] = $dir . 'src/DataValues/Scribunto/Lua/DataValueLibrary.php';
$wgAutoloadClasses['DataValues\Scribunto\Lua\StringValueLibrary'] = $dir . 'src/DataValues/Scribunto/Lua/StringValueLibrary.php';

$wgHooks['UnitTestsList'][] = function( array &$files ) {
	$dir = __DIR__ . '/tests/src/DataValues/Scribunto/Lua/';

	$files[] = $dir . 'DataValuesLibraryTest.php';
	$files[] = $dir . 'StringValueLibraryTest.php';

	return true;
};

$wgHooks['ScribuntoExternalLibraries'][] = 'DataValues\Scribunto\Hooks::onScribuntoExternalLibraries';