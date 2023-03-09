<?php

declare(strict_types=1);

use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;

call_user_func(function ($extKey = 'PREPARE_LOWERVENDOR_site') {


    $newColumns = [
        'tx_PREPARE_LOWERVENDORsite_header2' => [
            'label' => 'Heute',
            'config' => [
                'type' => 'input',
                'size' => 50,
                'eval' => 'trim',
                'max' => 255
            ],
        ],
        'tx_PREPARE_LOWERVENDORsite_header3' => [
            'label' => 'Morgen',
            'config' => [
                'type' => 'input',
                'size' => 50,
                'eval' => 'trim',
                'max' => 255
            ],
        ],
        'tx_PREPARE_LOWERVENDORsite_bodytext2' => [
            'label' => 'Heute',
            'config' => [
                'cols' => 80,
                'rows' => 15,
                'type' => 'text',
            ],
        ],
        'tx_PREPARE_LOWERVENDORsite_bodytext3' => [
            'label' => 'Morgen',
            'config' => [
                'cols' => 80,
                'rows' => 15,
                'type' => 'text',
            ],
        ],
        'tx_PREPARE_LOWERVENDORsite_headersize' => [
            'label' => 'Größe',
            'config' => [
                'type' => 'select',
                'renderType' => 'selectSingle',
                'default' => 0,
                'items' => [
                    ['Wie Type', 0],
                    ['Am größten', 1],
                    ['2', 2],
                    ['3', 3],
                    ['4', 4],
                    ['5', 5],
                    ['Am kleinsten', 6],
                    ['White Background', 7],
                ],
            ],
        ],
        'tx_PREPARE_LOWERVENDORsite_checkbox' => [
            'exclude' => 0,
            'label' => 'Render On News Detail',
            'config' => [
                'default' => 0,
                'type' => 'check',
            ]
        ],
    ];

    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTCAcolumns(
        'tt_content',
        $newColumns
    );

    $GLOBALS['TCA']['tt_content']['columns']['header']['config']['eval'] = 'trim';
    $GLOBALS['TCA']['tt_content']['palettes']['header'] = [
        'label' => 'LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:palette.headers',
        'showitem' => '
            header;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:header_formlabel, --linebreak--,
            header_layout;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:header_layout_formlabel,
            tx_PREPARE_LOWERVENDORsite_headersize;headerstyle,
            date;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:date_formlabel, --linebreak--,
            header_link;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:header_link_formlabel
    '
    ];

    $GLOBALS['TCA']['tt_content']['types']['textpic']['columnsOverrides']['assets']['config']['overrideChildTca']['columns']['crop']['config'] = [
        'cropVariants' => [
            'default' => [
                'title' => '1:1',
                'allowedAspectRatios' => [
                    'NaN' => [
                        'disabled' => true,
                    ],
                    '16:9' => [
                        'disabled' => true,
                    ],
                    '4:5' => [
                        'disabled' => true,
                    ],
                    '5:4' => [
                        'disabled' => true,
                    ],
                    'default' => [
                        'title' => '1:1',
                        'value' => 1,
                    ],
                ],
            ],
        ],
    ];

    $newElements = [
        [
            'id' => 'basic_elements',
            'title' => 'Basic elements',
            'postion' => 'after:special',
            'elements' => [
                [
                    'title' => 'Street',
                    'ctype' => 'street',
                    'icon' => 'content-image',
                    'config' => [

                        'columnsOverrides' => [
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,header, subheader;Gestern, bodytext; Gestern,  tx_PREPARE_LOWERVENDORsite_header2, tx_PREPARE_LOWERVENDORsite_bodytext2,
                                tx_PREPARE_LOWERVENDORsite_header3,tx_PREPARE_LOWERVENDORsite_bodytext3,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Text mit Bild',
                    'ctype' => 'textpic',
                    'icon' => 'content-textpic',
                    'config' => [
                        'columnsOverrides' => [
                            'bodytext' => [
                                'config' => [
                                    'type' => 'text',
                                    'enableRichtext' => true,
                                ],
                            ],
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'default' => [
                                                            'title' => 'default',
                                                            'allowedAspectRatios' => [
                                                                'NaN' => [
                                                                    'title' => 'Frei',
                                                                    'value' => 0.0,
                                                                ],
                                                                '358 / 358' => [
                                                                    'title' => 'Text beside',
                                                                    'value' => 358 / 358,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg,svg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, subheader;Headline_H3, bodytext,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.images,
                                 imageorient, image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Text',
                    'ctype' => 'text',
                    'icon' => 'content-text',
                    'config' => [
                        'columnsOverrides' => [
                            'bodytext' => [
                                'config' => [
                                    'type' => 'text',
                                    'enableRichtext' => true
                                ],
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, --palette--;;header, bodytext,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Bild',
                    'ctype' => 'image',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                'NaN' => [
                                                                    'title' => 'Frei',
                                                                    'value' => 0.0,
                                                                ],
                                                                'square' => [
                                                                    'title' => 'Fast Quadratisch',
                                                                    'value' => 455 / 450,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, --palette--;;header, subheader, image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Hero',
                    'ctype' => 'hero',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'bodytext' => [
                                'config' => [
                                    'type' => 'text',
                                    'enableRichtext' => true
                                ],
                            ],
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 2,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  --palette--;;header, bodytext,  image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Banner',
                    'ctype' => 'banner',
                    'icon' => 'form-image-upload',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  --palette--;;header,  image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Card',
                    'ctype' => 'card',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'bodytext' => [
                                'config' => [
                                    'type' => 'text',
                                    'enableRichtext' => true,
                                    'richtextConfiguration' => 'minimal',
                                ],
                            ],
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'default' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '455 / 450' => [
                                                                    'title' => 'Dektop',
                                                                    'value' => 455 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  header;Titel, bodytext, image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Contact',
                    'ctype' => 'contact',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '430 / 455' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 430 / 455,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  --palette--;;header,  image, bodytext, tx_PREPARE_LOWERVENDORsite_header2;Number, tx_PREPARE_LOWERVENDORsite_bodytext2;Mail, tx_PREPARE_LOWERVENDORsite_bodytext3;Link,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Header',
                    'ctype' => 'header',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  --palette--;;header,  image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Link',
                    'ctype' => 'link',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, header;Link-Titel, header_link, subheader;Link-Text,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Download',
                    'ctype' => 'download',
                    'icon' => 'actions-download',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, header;Link-Titel, header_link, subheader;Link-Text,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Map',
                    'ctype' => 'map',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  --palette--;;header,  image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Tab',
                    'ctype' => 'tab',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general,  --palette--;;header,  image,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
                [
                    'title' => 'Anchor',
                    'ctype' => 'anchor',
                    'icon' => 'content-image',
                    'config' => [
                        'columnsOverrides' => [
                            'image' => [
                                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                                    'image', [
                                    'appearance' => [
                                        'createNewRelationLinkTitle' => 'Hinzufügen',
                                    ],
                                    'overrideChildTca' => [
                                        'types' => [
                                            \TYPO3\CMS\Core\Resource\File::FILETYPE_IMAGE => [
                                                'showitem' => '
		                    --palette--;LLL:EXT:lang/Resources/Private/Language/locallang_tca.xlf:sys_file_reference.imageoverlayPalette;imageoverlayPalette,
		                    --palette--;;filePalette',
                                            ],
                                        ],
                                        'columns' => [
                                            'crop' => [
                                                'config' => [
                                                    'cropVariants' => [
                                                        'desktop' => [
                                                            'title' => 'desktop',
                                                            'allowedAspectRatios' => [
                                                                '1450 / 550' => [
                                                                    'title' => 'Desktop',
                                                                    'value' => 1450 / 550,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'tablet' => [
                                                            'title' => 'Tablet',
                                                            'allowedAspectRatios' => [
                                                                '760 / 370' => [
                                                                    'title' => 'Tablet',
                                                                    'value' => 760 / 370,
                                                                ],
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                        'mobile' => [
                                                            'title' => 'Mobile',
                                                            'allowedAspectRatios' => [
                                                                '440 / 450' => [
                                                                    'title' => 'Mobile',
                                                                    'value' => 440 / 450,
                                                                ]
                                                            ],
                                                            'cropArea' => [
                                                                'x' => 0,
                                                                'y' => 0,
                                                                'width' => 1,
                                                                'height' => 1,
                                                            ],
                                                        ],
                                                    ],
                                                ],
                                            ],
                                        ],

                                    ],
                                    'maxitems' => 1,
                                ],
                                    'png,jpg,jpeg'
                                ),
                            ],
                        ],
                        'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, header,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
                    ],
                ],
            ],
        ],
    ];

    foreach ($newElements as $group) {
        ExtensionManagementUtility::addTcaSelectItemGroup(
            'tt_content',
            'CType',
            $extKey . '_' . $group['id'],
            $group['title'],
            $group['postion']);
        foreach ($group['elements'] as $element) {
            $ctype = $extKey . '_' . $element['ctype'];
            ExtensionManagementUtility::addTcaSelectItem(
                'tt_content',
                'CType',
                [
                    $element['title'],
                    $ctype,
                    $element['icon'],
                    $group['id'],
                ],
            );

            $GLOBALS['TCA']['tt_content']['types'][$ctype] = $element['config'];
            $GLOBALS['TCA']['tt_content']['ctrl']['typeicon_classes'][$ctype] = $element['icon'];

        }
    }
});
