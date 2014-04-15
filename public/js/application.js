$(document).ready(function() {
  // Displays the login message (login/register)
  $('#container').mouseenter('#loginbutton', function() {
    $('#submitmessage').animate({ opacity:1 });
  });

  $('#container').mouseleave('#loginbutton', function() {
    $('#submitmessage').animate({ opacity:0 });
  });

  // Displays the log message
  $('#submitbutton').mouseenter(function() {
    $('#submitmessage').animate({ opacity:1 });
  });

  $('#submitbutton').mouseleave(function() {
    $('#submitmessage').animate({ opacity:0 });
  });

  // Sets the placeholders when you mouseover login username and password
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

  // NEW USER
  $('.register').on('click', function(event) {
    event.preventDefault();

    $.ajax({
      type: 'GET',
      url:  $(this).attr('href')
    })
      .done(function(server_data) {
        $("#container")
          .html(server_data)
        })

      .fail(function(server_data) {
        $("#container")
          .effect('highlight', { color: 'pink' }, 700)
        })
  });

  // COMPLETE MISSION
  $('#missions').on('click', '.complete', function(event) {
    event.preventDefault();

    var parent = $(event.target).closest("div");

    $.ajax({
      type: 'PUT',
      url:  $(this).attr('href')
    })
      .done(function(server_data) {
        parent
          .effect('highlight', { color: 'green' }, 700, function() {
            parent.replaceWith(server_data)
            })
        })

      .fail(function(server_data) {
        parent
          .effect('highlight', { color: 'pink' }, 700)
        })
  });

  // DELETE MISSION
  $('#missions').on('click', '.delete', function(event) {
    event.preventDefault();

    var parent = $(event.target).closest("div");

    $.ajax({
      type: 'DELETE',
      url:  $(this).attr('href')
    })
      .done(function(server_data) {
        parent
          .effect('highlight', { color: 'red' }, 700, function() {
            parent.fadeOut(500).remove()
            })
        })

      .fail(function(server_data) {
        parent
          .effect('highlight', { color: 'pink' }, 700)
        })
  });

  // NEW MISSION
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

        $("#inputmission")
          .find("form")[0]
            .reset()
        })

      .fail(function(server_data) {
        $("inputmission")
          .effect('highlight', { color: 'pink' }, 700)
        })
  });

  // UPDATE MISSION
  $('#missions').on('click', '.update', function(event) {
    event.preventDefault();

    var parent = $(event.target).closest("div");

    $.ajax({
      type: 'GET',
      url:  $(this).attr('href')
    })
      .done(function(server_data) {
        parent
          .html(server_data)
        })

      .fail(function(server_data) {
        parent
          .effect('highlight', { color: 'pink' }, 700)
        })
  });

  // SAVE UPDATED MISSION
  $('#missions').on('click', '.save', function(event) {
    event.preventDefault();

    var parent = $(event.target).closest("div").parent("div");

    $.ajax({
      type: 'PUT',
      url:  $(this).attr('href'),
      data: parent
              .find("form")
                .serialize()
    })
      .done(function(server_data) {
        parent
          .effect('highlight', { color: 'green' }, 700, function() {
            parent.replaceWith(server_data)
            })
        })

      .fail(function(server_data) {
        parent
          .effect('highlight', { color: 'pink' }, 700)
        })
  });
});