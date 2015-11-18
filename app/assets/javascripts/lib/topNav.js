$(document).ready(function() {
    var distance = $('#topNav').offset().top,
        $window = $(window);

    $window.scroll(function() {
        if ( $window.scrollTop() >= distance ) {
            $('#topNav').addClass('navbar-fixed');
            $('#topNav').removeClass('navbar-absolute');
        } else {
            $('#topNav').removeClass('navbar-fixed');
            $('#topNav').addClass('navbar-absolute');
        }
    });
});