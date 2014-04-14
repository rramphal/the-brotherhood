$(document).ready(function() {
  $('#submitbutton').mouseenter(function() {
    $('#submitmessage').animate({ opacity:1 });
  });

  $('#submitbutton').mouseleave(function() {
    $('#submitmessage').animate({ opacity:0 });
  });

  $('#login_username').mouseenter(function() {
    $('#login_username').attr("placeholder", "alias");
  });

  $('#login_username').mouseleave(function() {
    $('#login_username').attr("placeholder", "");
  });

  $('#login_password').mouseenter(function() {
    $('#login_password').attr("placeholder", "key");
  });

  $('#login_password').mouseleave(function() {
    $('#login_password').attr("placeholder", "");
  });
});
