$(document).ready( function() {
  $('.froala-editor').each(function () {
    var options = {};
    options = $.extend({}, options, $(this).data( 'options' ));
    $(this).froalaEditor( options );
  });
});
