Event.observe(window, 'load', function() {
  Event.observe('loginbutton', 'click', function() {
    $('loginbutton').hide();
    $('loginform').show();
    $('username').focus();
  });
});
