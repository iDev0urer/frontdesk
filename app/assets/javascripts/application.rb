require 'components'
require 'react_ujs'
require 'jquery'      # You need both these files to access jQuery from Opal.
require 'opal-jquery' # They must be in this order.

Document.ready? do
  video = Element.find('.video-responsive')
  jumbotron_dimensions = {
      height: Element.find('.index-jumbotron').css('height'),
      width: Element.find('.index-jumbotron').css('width')
  }

  video.css 'height', jumbotron_dimensions[:height]
end