Event.observe(window, 'load', function() {
  $('loginform').hide();
  Event.observe('loginbutton', 'click', function() {
    $('loginbutton').hide();
    $('loginform').show();
    $('username').focus();
  });
});
