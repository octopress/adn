# App.net Timeline

This plugin makes it easy to display an recent App.net posts for a user or hashtag in an Octoprss or Jekyll site.

This plugin has been adapted from [imathis/adn-timeline](https://github.com/imathis/adn-timeline).

## Dependencies

1. [ConfigTag](https://github.com/octopress/config-tag) Jekyll plugin (included with Octopress)
2. jQuery (inlcuded with Octopress)
3. [jQuery.cookie](https://github.com/imathis/adn-timeline/blob/master/javascripts/lib/jquery.cookie.min.js) (optional but recommended)

This plugin ships with Sass. If you need it, you can use [this CSS](https://github.com/imathis/adn-timeline/blob/master/stylesheets/adn-timeline.css) instead.

## Manual Installation (Octopress 2.0)

Copy the javascripts, stylesheets, and plugins to their respective locations for your site.

```
javascripts/adn-timeline.min.js -> [your-site]/source/javascripts/adn-timeline.min.js
stylesheets/_adn-timeline.scss  -> [your-site]/sass/plugins/_adn-timeline.scss
plugins/adn_timeline.rb         -> [your-site]/plugins/adn_timeline.rb
```

In your `sass/custom/_styles.scss` stylesheet add the following:

```scss
@import 'adn-timeline';

// Include the layout and theme mixins
.adn-timeline {
  @include adn-timeline-layout;
  @include adn-timeline-theme;
}
```

Next copy the default configuration from [configs/_adn-timeline.yml](https://github.com/octopress/adn-timeline/blob/master/configs/_adn-timeline.yml) into your site's configs and change as necessary. And finally, add the necessary javascripts to your site's head in `source/_includes/custom/head.html` like this:

```html
<script type="text/javascript" src="{{ root_url }}/javascripts/adn-timeline.js"></script>
```

## Usage

Wherever you want your App.net timeline to appear, simply use the adn_timeline liquid tag. Here's an example.

```html
<section>
<h1>On App.net</h1>
{% adn_timeline %}
<p>
  Follow <a href="https://alpha.app.net/{{ site.adn_timeline.username }}>@{{ site.adn_timeline.username }}</a>.
</p>
</section>
```

This will replace the liquid tag with the following html:

```html
<div class='adn-timeline' data-avatars='false' data-count='4' data-replies='false' data-reposts='false' data-username='your-username'></div>
<script type='text/javascript'>$(document).ready(function(){ AdnTimeline.init() })</script>
```

The `AdnTimeline.init()` script will read the configuration variables from the div, fetch recent posts and inject them into the `.adn-timeline` div.
