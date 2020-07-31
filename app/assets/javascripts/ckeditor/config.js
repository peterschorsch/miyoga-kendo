ClassicEditor
    .create( document.querySelector( '#editor' ), {
        plugins: [ Indent, IndentBlock, ... ],
        toolbar: {
            items: [ 'heading', '|', 'outdent', 'indent', '|', 'bulletedList', 'numberedList', '|', 'undo', 'redo' ]
        },
        indentBlock: {
            classes: [
                'custom-block-indent-a', // First step - smallest indentation.
                'custom-block-indent-b',
                'custom-block-indent-c'  // Last step - biggest indentation.
            ]
        }
    } )

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
