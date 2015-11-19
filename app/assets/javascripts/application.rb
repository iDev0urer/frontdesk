require 'components'
require 'react_ujs'
require 'jquery'      # You need both these files to access jQuery from Opal.
require 'opal-jquery' # They must be in this order.
require_tree './lib'

Document.ready? do

  Document.on 'scroll' do
    distance = Element.find('#topNav').offset.top
    $window = `$(window)`
    if $window.scroll_top >= distance
      Element.find('#topNav').css 'position', 'fixed'
    else
      Element.find('#topNav').css 'position', 'absolute'
    end
  end

  `$('.covervid-video').coverVid(2100, 1120);`
end