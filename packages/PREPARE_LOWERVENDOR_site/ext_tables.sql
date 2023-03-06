#
# Table structure for table 'tt_content'
#
CREATE TABLE tt_content
(
	tx_PREPARE_LOWERVENDORsite_headersize varchar(255) DEFAULT '' NOT NULL,
	tx_PREPARE_LOWERVENDORsite_checkbox   tinyint(3) unsigned DEFAULT '0' NOT NULL,

	tx_PREPARE_LOWERVENDORsite_header2 varchar(255) DEFAULT '' NOT NULL,
	tx_PREPARE_LOWERVENDORsite_header3 varchar(255) DEFAULT '' NOT NULL,

	tx_PREPARE_LOWERVENDORsite_bodytext2 text DEFAULT '' NOT NULL,
	tx_PREPARE_LOWERVENDORsite_bodytext3 text DEFAULT '' NOT NULL

);

