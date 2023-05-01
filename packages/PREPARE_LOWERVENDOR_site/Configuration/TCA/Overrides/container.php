<?php

declare(strict_types=1);

use B13\Container\Tca\ContainerConfiguration;
use B13\Container\Tca\Registry;
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;
use TYPO3\CMS\Core\Utility\GeneralUtility;

defined('TYPO3') or die();

call_user_func(function ($extKey = 'mono_site') {

    $containers = [
        'col50-50' => [
            'label' => '2 Spalten Container',
            'description' => '2 Spalten gleiche Breite',
            'iconIdentifier' => 'content-container-columns-2',
            'config' => [
                [
                    [
                        'name' => 'Links',
                        'colPos' => 1000
                    ],

                    [
                        'name' => 'Rechts',
                        'colPos' => 1001
                    ]
                ]
            ]
        ],
        'col40-40' => [
            'label' => 'Profilkarten',
            'description' => '',
            'iconIdentifier' => 'actions-viewmode-tiles',
            'config' => [
                [
                    [
                        'name' => 'Karten',
                        'colPos' => 1000
                    ],
                ]
            ]
        ],
        'col40-60' => [
            'label' => '2 Spalten Container 40 - 60',
            'description' => '2 Spalten 40 - 60',
            'iconIdentifier' => 'content-container-columns-2',
            'config' => [
                [
                    [
                        'name' => 'Links',
                        'colPos' => 1000
                    ],

                    [
                        'name' => 'Rechts',
                        'colPos' => 1001
                    ]
                ]
            ]
        ],
        'col33-33-33' => [
            'label' => '3 Spalten Container 33 - 33 - 33',
            'description' => '3 Spalten Container 33 - 33 - 33',
            'iconIdentifier' => 'content-container-columns-3',
            'config' => [
                [
                    [
                        'name' => 'Links',
                        'colPos' => 1000
                    ],
                    [
                        'name' => 'Mitte',
                        'colPos' => 1001
                    ],
                    [
                        'name' => 'Rechts',
                        'colPos' => 1002
                    ]
                ]
            ]
        ],
        'col80' => [
            'label' => '1-spaltiger Container - 80',
            'description' => '1-spaltiger Container - 80',
            'iconIdentifier' => 'content-container-columns-1',
            'config' => [
                [
                    [
                        'name' => 'Mitte',
                        'colPos' => 1000
                    ],
                ]
            ]
        ],
        'col100' => [
            'label' => '1-spaltiger Container - 100',
            'description' => '1-spaltiger Container - 100',
            'iconIdentifier' => 'content-container-columns-1',
            'config' => [
                [
                    [
                        'name' => 'Mitte',
                        'colPos' => 1000
                    ],
                ]
            ]
        ],
        'col4-25' => [
            'label' => '4 Spalten Container 4x25',
            'description' => '4 Spalten Container 4x25',
            'iconIdentifier' => 'content-container-columns-4',
            'config' => [
                [
                    [
                        'name' => '1',
                        'colPos' => 1000
                    ],
                    [
                        'name' => '2',
                        'colPos' => 1001
                    ],
                    [
                        'name' => '3',
                        'colPos' => 1002
                    ],
                    [
                        'name' => '4',
                        'colPos' => 1003
                    ]
                ]
            ]
        ],
        'timeline' => [
            'label' => 'Timeline',
            'description' => 'Timeline',
            'iconIdentifier' => 'content-container-columns-4',
            'config' => [
                [
                    [
                        'name' => 'Timeline',
                        'colPos' => 1000,
                        'allowed' => [
                            'CType' => 'mono_site_timelinecontent'
                        ],
                    ]
                ]
            ]
        ],
        'slider' => [
            'label' => 'Slider',
            'description' => 'slider',
            'iconIdentifier' => 'content-container-columns-1',
            'config' => [
                [
                    [
                        'name' => 'Mitte',
                        'colPos' => 1000
                    ],
                ]
            ]
        ],


    ];

    foreach ($containers as $key => $container) {
        $ctype = $extKey . '_' . $key;
        $registry = GeneralUtility::makeInstance(Registry::class);
        $containerConfiguration = new ContainerConfiguration($ctype, $container['label'], $container['description'], $container['config']);
        $containerConfiguration->setIcon($container['iconIdentifier']);
        $registry->configureContainer($containerConfiguration);
        $GLOBALS['TCA']['tt_content']['palettes']['containerWrapper'] = [
            'showitem' => 'bodytext, image',
            'label' => 'Intro-Text (Optional) and Background-Image'
        ];
        $GLOBALS['TCA']['tt_content']['types'][$ctype]['showitem'] = '
            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                --palette--;;general,
                --palette--;;header,
                --palette--;;containerWrapper,
            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance,
                --palette--;;frames,
                --palette--;;appearanceLinks,
            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:language,
                --palette--;;language,
            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                --palette--;;hidden,
                --palette--;;access,
            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:categories,
                categories,
            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:notes,
                rowDescription,
            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:extended
        ';
    }
});
