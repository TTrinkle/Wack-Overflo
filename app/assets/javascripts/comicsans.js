var comicSans = function() {
  Mousetrap.bind('up up down down left right left right', function() {
    $('body').hide().css("font-family", 'Bubblegum Sans').fadeIn(3000);
  });
}

$(document).ready(comicSans)
$(window).bind('page:change', comicSans)

