(function () {
  'use strict'

  // --- functions -------------------------------------------------------------
  function initFroalaEditors() {
    $('[data-aa-froala-editor]').each(function () {
      if (!$(this).hasClass('froala-editor--active')) {
        let name = $(this).attr('name');
        if (name) {
          let options = {
            quickInsertButtons: ['table', 'ol', 'ul', 'hr'],
            requestHeaders: {
              'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            },
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
            }
          }
          let input_options = $(this).data('options')
          if(!input_options && window.froala_options) input_options = window.froala_options[name]
          options = $.extend({}, options, input_options)

          new FroalaEditor('[data-aa-froala-editor][name="' + name + '"]', options)
          $(this).addClass('froala-editor--active')
        }
      }
    })
  }

  // --- events ----------------------------------------------------------------
  $(document).ready(initFroalaEditors)
  $(document).on('has_many_add:after', '.has_many_container', initFroalaEditors)
  $(document).on('turbolinks:load', initFroalaEditors)
})()
