<?php

if (!defined('TYPO3_MODE')) {
    die('Access denied.');
}

$temporaryColumn = [
    'tx_PREPARE_LOWERVENDORsite_imagesizes' => [
        'exclude' => 0,
        'label' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang_db.xlf:PREPARE_LOWERVENDOR_site.imagesizes',
        'config' => [
            'type' => 'select',
            'renderType' => 'selectSingle',
            'items' => [
                ['Default', '100'],
                ['25%', '25'],
                ['33.33%', '33'],
            ],
            'default' => '100',
        ]
    ]
];
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTCAcolumns(
    'tt_content',
    $temporaryColumn
);
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addFieldsToPalette(
    'tt_content',
    'mediaAdjustments',
    'tx_PREPARE_LOWERVENDORsite_imagesizes',
    'after:imageborder'
);

\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->configureContainer(
    (
    new \B13\Container\Tca\ContainerConfiguration(
        'cols_2',
        'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:ctype.col-2.title',
        'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:ctype.col-2.desc',
        [
            [
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-201', 'colPos' => 201, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']],
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-202', 'colPos' => 202, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']]
            ]
        ]
    )
    )
        // set and optional icon configuration
        ->setIcon('EXT:container/Resources/Public/Icons/container-2col.svg')
        ->setSaveAndCloseInNewContentElementWizard(false)
);
$GLOBALS['TCA']['tt_content']['types']['cols_2']['showitem'] = 'sys_language_uid,hidden,CType,header,header_layout,header_position,layout,colPos,tx_container_parent,sectionIndex;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:sectionIndex_formlabel';
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->configureContainer(
    (
    new \B13\Container\Tca\ContainerConfiguration(
        'cols_3',
        'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:ctype.col-3.title',
        'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:ctype.col-3.desc',
        [
            [
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-301', 'colPos' => 301, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']],
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-302', 'colPos' => 302, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']],
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-303', 'colPos' => 303, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']]
            ]
        ]
    )
    )
        // set and optional icon configuration
        ->setIcon('EXT:container/Resources/Public/Icons/container-3col.svg')
        ->setSaveAndCloseInNewContentElementWizard(false)
);
$GLOBALS['TCA']['tt_content']['types']['cols_3']['showitem'] = 'sys_language_uid,hidden,CType,header,header_layout,header_position,layout,colPos,tx_container_parent,sectionIndex;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:sectionIndex_formlabel';
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->configureContainer(
    (
    new \B13\Container\Tca\ContainerConfiguration(
        'cols_4',
        'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:ctype.col-4.title',
        'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:ctype.col-4.desc',
        [
            [
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-401', 'colPos' => 401, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']],
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-402', 'colPos' => 402, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']],
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-403', 'colPos' => 403, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']],
                ['name' => 'LLL:EXT:PREPARE_LOWERVENDOR_site/Resources/Private/Language/locallang.xlf:colpos-404', 'colPos' => 404, 'disallowed' => ['CType' => 'cols_2, cols_3, cols_4']]
            ]
        ]
    )
    )
        // set and optional icon configuration
        ->setIcon('EXT:container/Resources/Public/Icons/container-4col.svg')
        ->setSaveAndCloseInNewContentElementWizard(false)
);
$GLOBALS['TCA']['tt_content']['types']['cols_4']['showitem'] = 'sys_language_uid,hidden,CType,header,header_layout,header_position,layout,colPos,tx_container_parent,sectionIndex;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:sectionIndex_formlabel';
