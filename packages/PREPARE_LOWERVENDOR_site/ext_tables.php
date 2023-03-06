<?php

defined('TYPO3_MODE') || exit();

(static function (): void {
    $extensionKey = 'PREPARE_LOWERVENDOR_site';

    $rtePresets = [
        'full',
        'list',
        'minimal',
    ];

    foreach ($rtePresets as $preset) {
        $GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets'][$preset] = 'EXT:' . $extensionKey . '/Configuration/CKEditor/' . $preset . '.yaml';
    }

    $GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets']['standard'] = 'EXT:' . $extensionKey . '/Configuration/CKEditor/minimal.yaml';


    $pageDoktypes = [101];

    foreach ($pageDoktypes as $pageDoktype) {
        $GLOBALS['PAGES_TYPES'][$pageDoktype] = [
            'type' => 'web',
            'allowedTables' => '*',
        ];
    }

})();

