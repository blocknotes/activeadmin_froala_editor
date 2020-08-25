function initFroalaEditors() {
  $('.froala-editor').each(function () {
    if(!$(this).hasClass('froala-editor--active')) {
      var name = $(this).attr('name');
      if(name) {
        var options = {
          toolbarButtons: {
            moreText: {
              buttons: ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', 'textColor', 'backgroundColor', 'inlineClass', 'inlineStyle', 'clearFormatting'],
              align: 'left',
              buttonsVisible: 3
            },
            moreParagraph: {
              buttons: ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'paragraphFormat', 'paragraphStyle', 'lineHeight', 'outdent', 'indent', 'quote'],
              align: 'left',
              buttonsVisible: 3
            },
            moreRich: {
              buttons: ['insertLink', 'insertTable', 'emoticons', 'specialCharacters', 'insertHR'],
              align: 'left',
              buttonsVisible: 2
            },
            moreMisc: {
              buttons: ['undo', 'redo', 'print'],
              align: 'right',
              buttonsVisible: 3
            }
          },
          quickInsertButtons: ['table', 'ol', 'ul', 'hr']
        };
        options = $.extend({}, options, $(this).data('options'));
        new FroalaEditor('.froala-editor[name="' + name + '"]', options);
        $(this).addClass('froala-editor--active');
      }
    }
  });
}

$(document).on('has_many_add:after', function () {
  initFroalaEditors();
});

$(document).ready( function() {
  initFroalaEditors();
});
