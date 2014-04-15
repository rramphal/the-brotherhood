$(document).ready(function() {
  $('#submitbutton, #loginbutton').mouseenter(function() {
    $('#submitmessage').animate({ opacity:1 });
  });

  $('#submitbutton, #loginbutton').mouseleave(function() {
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

  $('#missions').on('click', '.complete', function(event) {
    event.preventDefault();

    parent = $(event.target).closest("div")

    $.ajax({
      type: 'PUT',
      url:  $(this).attr('href')
    })
      .done(function(server_data) {
        parent
          .effect('highlight', { color: 'green' }, 1000, function() {
            parent.replaceWith(server_data)
            })
        })

      .fail(function(server_data) {
        parent
          .effect('highlight', { color: 'pink' }, 1000)
        })
  });

  $('#missions').on('click', '.delete', function(event) {
    event.preventDefault();

    parent = $(event.target).closest("div")

    $.ajax({
      type: 'DELETE',
      url:  $(this).attr('href')
    })
      .done(function(server_data) {
        parent
          .effect('highlight', { color: 'red' }, 1000, function() {
            parent.fadeOut(500).remove()
            })
        })

      .fail(function(server_data) {
        parent
          .effect('highlight', { color: 'pink' }, 1000)
        })
  });

  $('#submitbutton').on('click', function(event) {
    event.preventDefault();

    $.ajax({
      type: 'POST',
      url:  $(this).attr('href'),
      data: $("#inputmission")
              .find("form")
                .serialize()
    })
      .done(function(server_data) {
        $("#missions")
          .prepend(server_data)
        })

      .fail(function(server_data) {
        $("inputmission")
          .effect('highlight', { color: 'pink' }, 1000)
        })
  });
});