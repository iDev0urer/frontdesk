$(document).ready(function() {
    var distance = $('#topNav').offset().top,
        $window = $(window);

    $window.scroll(function() {
        if ( $window.scrollTop() >= distance ) {
            $('.top-nav-index').addClass('navbar-fixed');
            $('.top-nav-index').removeClass('navbar-absolute');
        } else {
            $('.top-nav-index').removeClass('navbar-fixed');
            $('.top-nav-index').addClass('navbar-absolute');
        }
    });
});