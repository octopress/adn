module Octopress
  module ADN
    class Timeline < Liquid::Tag
      include ConfigHelper
      def initialize(tag_name, markup, tokens)
        super
      end
    
      def render(context)
        output = config_tag(context, 'adn.timeline')
        output += "\n<script type='text/javascript'>$(document).ready(function(){ timeline = require('adn/adn-timeline'); new timeline({username: '#{config(context, 'adn.username')}'}) })</script>"
      end
    end
    class Share < Liquid::Tag
      include ConfigHelper
      def initialize(tag_name, markup, tokens)
        super
      end
    
      def render(context)
        username = config(context, 'adn.username')
        <<-tag
          <a href="https://alpha.app.net/intent/follow/?user_id=%40#{username}" class='adn-button' target='_blank' data-type='follow' data-width='277' data-height='27' data-user-id='@#{username}' data-show-username='1' rel='me'>Follow me on App.net</a>
          <script>(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='//d2zh9g63fcvyrq.cloudfront.net/adn.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'adn-button-js'));</script>
        tag
      end
    end
    class Follow < Liquid::Tag
      include UrlHelpers
      def initialize(tag_name, markup, tokens)
        @markup = markup
        super
      end
    
      def render(context)
        url = encode_url page_url(context)
        <<-tag
          <a href='https://alpha.app.net/intent/post/?url=#{url}' class='adn-button' target='_blank' data-type='share' data-width='132' data-height='27' data-text='' data-url='#{url}' >Share on App.net</a>
          <script>(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='//d2zh9g63fcvyrq.cloudfront.net/adn.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'adn-button-js'));</script>
        tag
      end
    end
  end
end

Liquid::Template.register_tag('adn_timeline', Octopress::ADN::Timeline)
Liquid::Template.register_tag('adn_share', Octopress::ADN::Share)
Liquid::Template.register_tag('adn_follow', Octopress::ADN::Follow)
 
