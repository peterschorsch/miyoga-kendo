CKEDITOR.editorConfig = function (config) {
	config.toolbar_mini = [
		["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
	];
	config.toolbar = "mini";
	config.height = '20em';
	config.fullPage = false;
	config.resize_enabled = false;
	config.removePlugins = 'resize,autogrow';
}