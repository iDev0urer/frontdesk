require 'components'
require 'react_ujs'
require 'jquery'      # You need both these files to access jQuery from Opal.
require 'opal-jquery' # They must be in this order.
require_tree './lib'

Document.ready? do

  `$('.covervid-video').coverVid(2100, 1120);`
end