# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.rb.
# You can use Opal in this file: http://opalrb.org/
#
#
# Here's an example view class for your controller:
#
module Components
  module Static
    class Test
      include React::Component
      def render

        h1.test { 'Hello world' }

      end
    end
  end
end