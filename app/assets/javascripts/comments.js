var do_on_load = function() {
$('.show-comment').click(function(e){
  e.preventDefault();
  $(e.target).next('div').toggle();
});
}

$(document).ready(do_on_load)
$(window).bind('page:change', do_on_load)