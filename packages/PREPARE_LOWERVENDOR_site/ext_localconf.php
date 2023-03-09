<?php

$GLOBALS['TYPO3_CONF_VARS']['SC_OPTIONS']['t3lib/class.t3lib_tcemain.php']['clearCachePostProc'][] = PREPARE_UPPERVENDOR\PREPARE_CAPITALVENDORSite\Hooks\ReloadFrontendSignal::class . '->clearCachePostProc';
$GLOBALS ['TYPO3_CONF_VARS']['SC_OPTIONS']['t3lib/class.t3lib_tcemain.php']['processDatamapClass'][''] = PREPARE_UPPERVENDOR\PREPARE_CAPITALVENDORSite\Hooks\ReloadFrontendSignal::class;
$GLOBALS ['TYPO3_CONF_VARS']['SC_OPTIONS']['t3lib/class.t3lib_tcemain.php']['processCmdmapClass'][''] = PREPARE_UPPERVENDOR\PREPARE_CAPITALVENDORSite\Hooks\ReloadFrontendSignal::class;

defined('TYPO3_MODE') || exit();

/**
 *
 */
(static function (): void {
    $extensionKey = 'PREPARE_LOWERVENDOR_site';

    $iconIdentifiers = [
        'icon-image' => 'file-image-o',
        'icon-text' => 'align-justify',
        'icon-headline' => 'header',
        'icon-teaser' => 'square',
        'icon-teasergrid' => 'th-large',
        'icon-2col' => 'columns',
        'icon-2row2col' => 'columns',
        'icon-video' => 'play-circle-o',
        'icon-file' => 'file-video-o',
        'icon-youtube' => 'youtube',
        'icon-author' => 'id-card-o',
        'icon-address' => 'link',
        'icon-newsletter' => 'newspaper-o',
        'icon-highlight' => 'align-left',
        'icon-check' => 'check-circle-o',
        'icon-fadein' => 'star-half',
        'icon-up' => 'angle-double-up',
        'icon-right' => 'angle-double-right',
        'icon-down' => 'angle-double-down',
        'icon-left' => 'angle-double-left',
        'icon-branch' => 'industry',
        'icon-customer' => 'user-circle-o',
        'icon-vcard' => 'address-card',
        'icon-project' => 'clipboard',
        'icon-accordion' => 'th-list',
        'icon-accordion-item' => 'plus-square',
        'icon-employee' => 'user',
        'icon-job-title' => 'address-card',
        'icon-list' => 'list',
    ];

    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
        '@import "EXT:' . $extensionKey . '/Configuration/TSconfig/Page/site.tsconfig">'
    );
    // Allow backend users to drag and drop the page type "Content":
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addUserTSConfig(
        'options.pageTree.doktypesToShowInNewPageDragArea := addToList(101)'
    );

    $GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets']['custom'] = 'EXT:PREPARE_LOWERVENDOR_site/Configuration/RTE/custom.yaml';

//    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addUserTSConfig('@import "EXT:PREPARE_LOWERVENDOR_site/Configuration/TypoScript/User.tsconfig"');
//    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptSetup('@import "EXT:PREPARE_LOWERVENDOR_site/Configuration/TypoScript/Rootpages/Project1/setup.tsconfig"');
//    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptConstants('@import "EXT:PREPARE_LOWERVENDOR_site/Configuration/TypoScript/Rootpages/Project1/constants.tsconfig"');

// Customize the label for the input field "Relationship" in the link browser
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['locallangXMLOverride']['EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf'][] = 'EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang_browse_links.xlf';
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['locallangXMLOverride']['de']['EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf'][] = 'EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/de.locallang_browse_links.xlf';

})();
