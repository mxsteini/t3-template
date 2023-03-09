$(document).ready(function ($) {

	$('#main-menu').smartmenus({
		markCurrentItem: 1,
		showTimeout:0,
	});
	$('#main-menu').smartmenus('keyboardSetHotkey', 123, 'shiftKey');

	$('#main-menu-v').smartmenus({
		markCurrentItem: 1,
		showTimeout: 0
	});
});
