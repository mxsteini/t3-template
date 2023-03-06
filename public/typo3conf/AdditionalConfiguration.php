<?php
/*
 * There's no need to edit this file anymore:
 *     Please edit settings for each environment using the .env file within the project root.
 */

$GLOBALS['TYPO3_CONF_VARS']['EXTENSIONS']['crawler'] = [
    'cleanUpOldQueueEntries' => '1',
    'cleanUpProcessedAge' => '2',
    'cleanUpScheduledAge' => '7',
    'countInARun' => '100',
    'crawlHiddenPages' => '0',
    'enableTimeslot' => '1',
    'frontendBasePath' => ' / ',
    'makeDirectRequests' => '0',
    'maxCompileUrls' => '10000',
    'phpBinary' => 'php',
    'phpPath' => '/opt/alt/php81/usr/bin/php',
    'processDebug' => '0',
    'processLimit' => '4',
    'processMaxRunTime' => '300',
    'processVerbose' => '0',
    'purgeQueueDays' => '14',
    'sleepAfterFinish' => '10',
    'sleepTime' => '1000',
];

$GLOBALS['TYPO3_CONF_VARS']['EXTENSIONS']['indexed_search'] = [
    'catdoc' => '/usr/bin/',
    'debugMode' => '0',
    'deleteFromIndexAfterEditing' => '1',
    'disableFrontendIndexing' => '1',
    'enableMetaphoneSearch' => '1',
    'flagBitMask' => '192',
    'fullTextDataLength' => '0',
    'ignoreExtensions' => '',
    'indexExternalURLs' => '0',
    'maxAge' => '0',
    'maxExternalFiles' => '5',
    'minAge' => '24',
    'pdf_mode' => '20',
    'pdftools' => '/usr/bin/',
    'ppthtml' => '/usr/bin/',
    'unrtf' => '/usr/bin/',
    'unzip' => '/usr/bin/',
    'useCrawlerForExternalFiles' => '1',
    'useMysqlFulltext' => '0',
    'xlhtml' => '/usr/bin/',
];

$GLOBALS['TYPO3_CONF_VARS']['EXTENSIONS']['staticfilecache'] = [
    'backendDisplayMode' => 'both',
    'boostMode' => '0',
    'cacheTagsEnable' => '1',
    'clearCacheForAllDomains' => '1',
    'debugHeaders' => '1',
    'disableInDevelopment' => '0',
    'enableGeneratorBrotli' => '0',
    'enableGeneratorGzip' => '1',
    'enableGeneratorManifest' => '0',
    'enableGeneratorPlain' => '0',
    'hashUriInCache' => '0',
    'htaccessTemplateName' => 'EXT:staticfilecache/Resources/Private/Templates/Htaccess.html',
    'overrideCacheDirectory' => '',
    'rawurldecodeCacheFileName' => '0',
    'renameTablesToOtherPrefix' => '0',
    'sendCacheControlHeaderRedirectAfterCacheTimeout' => '0',
    'sendHttp2PushEnable' => '0',
    'sendHttp2PushFileExtensions' => 'css,js',
    'sendHttp2PushFileLimit' => '10',
    'sendHttp2PushLimitToArea' => '',
    'useFallbackMiddleware' => '1',
    'useReverseUriLengthInPriority' => '1',
    'validHtaccessHeaders' => 'Content-Type,Content-Language,Link,X-SFC-Tags',
];


require_once __DIR__ . '/ConfigurationLoader.php';
$applicationContext = \TYPO3\CMS\Core\Core\Environment::getContext()->__toString();
$GLOBALS['TYPO3_CONF_VARS']['SYS']['sitename'] .= ' / ' . $applicationContext;
$GLOBALS['TYPO3_CONF_VARS']['BE']['versionNumberInFilename'] = true;
$GLOBALS['TYPO3_CONF_VARS']['FE']['versionNumberInFilename'] = 'embed';
$GLOBALS['TYPO3_CONF_VARS']['BE']['compressionLevel'] = 9;


// log all messages in syslog
/*
$GLOBALS['TYPO3_CONF_VARS']['LOG']['writerConfiguration'] = [
  \TYPO3\CMS\Core\Log\LogLevel::WARNING => [
    \TYPO3\CMS\Core\Log\Writer\SyslogWriter::class => [],
  ],
];

$GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = 0;
$GLOBALS['TYPO3_CONF_VARS']['SYS']['errorHandlerErrors']     = 22517; // E_ALL ^ E_DEPRECATED ^ E_NOTICE ^ E_WARNING (everything except deprecated-msgs and notices and warnings)
$GLOBALS['TYPO3_CONF_VARS']['SYS']['syslogErrorReporting']   = 22517; // E_ALL ^ E_DEPRECATED ^ E_NOTICE ^ E_WARNING (everything except deprecated-msgs and notices and warnings)
$GLOBALS['TYPO3_CONF_VARS']['SYS']['belogErrorReporting']    = 22517; // E_ALL ^ E_DEPRECATED ^

*/
