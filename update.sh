URL_BASE="https://raw.github.com/imathis/adn-timeline/master/"
coffee="javascripts/coffeescript/adn-timeline.coffee"
sass="stylesheets/sass/_adn-timeline.scss"

curl $URL_BASE$coffee > javascripts/modules/adn-timeline.coffee
curl $URL_BASE$sass > stylesheets/_style.scss
