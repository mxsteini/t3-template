<?php

if (!defined('TYPO3_MODE')) {
    die('Access denied.');
}

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile('PREPARE_LOWERVENDOR_site', 'Configuration/TypoScript/Rootpages/Project1', 'TYPO3 11 LTS Musterprojekt');

////// add folder for further projects within the installation here, can be selected in Root Template under Include Static /////

// \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile('PREPARE_LOWERVENDOR_site, 'Configuration/TypoScript/Rootpages/Project2', 'Individual Project Title');
