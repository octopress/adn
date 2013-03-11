URL_BASE="https://raw.github.com/imathis/adn-timeline/master/"
js="javascripts/adn-timeline.js"
jsm="javascripts/adn-timeline.min.js"
sass="stylesheets/sass/_adn-timeline.scss"

curl $URL_BASE$js > $js
curl $URL_BASE$jsm > $jsm
curl $URL_BASE$sass > stylesheets/_adn-timeline.scss
