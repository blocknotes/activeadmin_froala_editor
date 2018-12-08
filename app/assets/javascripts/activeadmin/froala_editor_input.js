function initFroalaEditors() {
  $('.froala-editor').each(function () {
    if (!$(this).hasClass('froala-editor--active')) {
      var options = {};
      options = $.extend({}, options, $(this).data('options'));
      $(this).froalaEditor(options);
      $(this).addClass('froala-editor--active');
    }
  });
}

$(document).on('has_many_add:after', function () {
  initFroalaEditors();
});

$(document).ready( function() {
  initFroalaEditors();
});
