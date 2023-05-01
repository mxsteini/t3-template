<?php

declare(strict_types=1);

use TYPO3\CMS\Core\Configuration\Loader\YamlFileLoader;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;
use TYPO3\CMS\Core\Utility\GeneralUtility;

call_user_func(function ($extKey = 'mono_site') {


  $newColumns = [
    'tx_monosite_icon' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'imageManipulation',
        'fileFolder_extList' => 'jpg,jpeg,png,svg',
        'maxWidth' => 1000,
        'maxHeight' => 1000,
        'minWidth' => 0,
        'minHeight' => 0,
        'crop' => 1,
        'showThumbs' => 1,
        'allowedExtensions' => 'jpg,jpeg,png,svg',
        'disallowedExtensions' => '',
        'size' => 1,
        'maxItems' => 1,
      ],
    ],
    'tx_monosite_header2' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_header3' => [
      'label' => 'Morgen',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_bodytext2' => [
      'label' => 'Heute',
      'config' => [
        'cols' => 80,
        'rows' => 15,
        'type' => 'text',
      ],
    ],
    'tx_monosite_bodytext3' => [
      'label' => 'Morgen',
      'config' => [
        'cols' => 80,
        'rows' => 15,
        'type' => 'text',
      ],
    ],
    'tx_monosite_headersize' => [
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
    'tx_monosite_checkbox' => [
      'exclude' => 0,
      'label' => 'Render On News Detail',
      'config' => [
        'default' => 0,
        'type' => 'check',
      ]
    ],
    'tx_monosite_input1' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_input2' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_input3' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_input4' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_input5' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_input6' => [
      'label' => 'Heute',
      'config' => [
        'type' => 'input',
        'size' => 50,
        'eval' => 'trim',
        'max' => 255
      ],
    ],
    'tx_monosite_date' => [
      'label' => 'inputdate eval=date',
      'config' => [
        'type' => 'input',
        'default' => 0,
        'renderType' => 'inputDateTime',
        'eval' => 'date',
      ],
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
            tx_monosite_headersize;headerstyle
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
    'mono_site_basic_elements' => [
      'title' => 'Basic elements',
      'postion' => 'after:special',
      'elements' => [
        'no_mono_site_text' => [
          'title' => 'Text only',
          'ctype' => 'text',
          'icon' => 'content-text',
          'config' => [
            'columnsOverrides' => [
              'bodytext' => [
                'config' => [
                  'type' => 'text',
                  'enableRichtext' => true,
                ],
              ],
            ],
            'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, --palette--;;header, subheader, bodytext,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
          ],
        ],
        'mono_site_textpic' => [
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
        'mono_site_image' => [
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
                  'png,jpg,jpeg,svg'
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
        'mono_site_video' => [
          'title' => 'Video (WIP)',
          'ctype' => 'video',
          'icon' => 'actions-file-video',
          'config' => [
            'columnsOverrides' => [
              'video' => [
                'config' => \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::getFileFieldTCAConfig(
                  'video', [
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
                  'mp4,avi,mov,webm'
                ),
              ],
            ],
            'showitem' => '
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:general,
                                --palette--;;general, --palette--;;header, subheader, image;Video,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
          ],
        ],
        'mono_site_hero' => [
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
                            --div--;ContactRectangle,
                                --palette--;;ContactRectangle, tx_monosite_header2;Header, tx_monosite_bodytext2;Text, tx_monosite_header3;Mail, tx_monosite_input2;Mobil Clickable, tx_monosite_input3;Mobil Readable,
                            --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.appearance, --palette--;;frames,
                            --div--;LLL:EXT:core/Resources/Private/Language/Form/locallang_tabs.xlf:access,
                                --palette--;;hidden,--palette--;;access,
                       ',
          ],
        ],
      ],
    ],
  ];


  if (file_exists(GeneralUtility::getFileAbsFileName('EXT:PREPARE_LOWERVENDOR_site/Configuration/TCA/Overrides/tt_content.yaml'))) {
    $tt_content = (new YamlFileLoader())->load(GeneralUtility::getFileAbsFileName('EXT:PREPARE_LOWERVENDOR_site/Configuration/TCA/Overrides/tt_content.yaml'));
    if (key_exists('sections', $tt_content) && is_array($tt_content['sections'])) {
      foreach ($tt_content['sections'] as &$section) {
        foreach ($section['elements'] as &$element) {
          $divs = [];
          foreach ($element['config']['showItem'] as $div) {
            $fields = implode(',', $div['fields']);
            $divs[] = '--div--;' . $div['title'] . ',' . $fields;
          }
          $element['config']['showitem'] = implode(',', $divs);
        }
      }
      $newElements = array_replace_recursive($tt_content['sections'], $newElements);
    }
  }

  foreach ($newElements as $groupdId => $group) {
    ExtensionManagementUtility::addTcaSelectItemGroup(
      'tt_content',
      'CType',
      $groupdId,
      $group['title'],
      $group['position'] ?? 'bottom');
    foreach ($group['elements'] as $ctype => $element) {
      ExtensionManagementUtility::addTcaSelectItem(
        'tt_content',
        'CType',
        [
          $element['title'],
          $ctype,
          $element['icon'],
          $groupdId,
        ],
      );

      $GLOBALS['TCA']['tt_content']['types'][$ctype] = $element['config'];
      $GLOBALS['TCA']['tt_content']['ctrl']['typeicon_classes'][$ctype] = $element['icon'];

    }
  }

});
