<?php

/**
 *
 */
(static function (): void {
    $extensionKey = 'PREPARE_LOWERVENDOR_site';

    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
        '@import "EXT:' . $extensionKey . '/Configuration/TSconfig/Page/site.tsconfig">'
    );

    $GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets']['custom'] = 'EXT:PREPARE_LOWERVENDOR_site/Configuration/RTE/custom.yaml';

})();
