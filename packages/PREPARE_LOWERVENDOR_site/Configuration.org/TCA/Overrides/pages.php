<?php
call_user_func(function ($extKey = 'PREPARE_LOWERVENDOR_site') {
    // Add article doctypes
    $articleDoktypes = [
        101 => [
            'type' => 'content',
            'icon' => 'content-panel',
        ]
    ];

    // add article page types
    foreach (array_reverse($articleDoktypes, true) as $id => $articleDoktype) {
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTcaSelectItem(
            'pages',
            'doktype',
            [
                'LLL:EXT:' . $extKey . '/Resources/Private/Language/locallang_db.xlf:pages.doktype.' . $id,
                $id,
                $articleDoktype['icon'],
            ],
            '1',
            'after'
        );

        \TYPO3\CMS\Core\Utility\ArrayUtility::mergeRecursiveWithOverrule(
            $GLOBALS['TCA']['pages'],
            [
                'ctrl' => [
                    'typeicon_classes' => [
                        $id => $articleDoktype['icon'],
                    ],
                ],
                'types' => [
                    $id => [
                        'showitem' => $GLOBALS['TCA']['pages']['types'][\TYPO3\CMS\Core\Domain\Repository\PageRepository::DOKTYPE_DEFAULT]['showitem'],
                    ],
                ],
            ]
        );
    }

});
