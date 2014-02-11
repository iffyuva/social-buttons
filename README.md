# Social Buttons

This gem is a Rails 3+ engine (but can be used without the engine).

Currently there is support for the following social buttons:

* Twitter *tweet* button
* Facebook *like* button
* Pinterest *pinit* button
* Google+ *+1* button

# Installation

Add the gem to your Gemfile and use Bundler to install the gem.

```ruby
gem "social-buttons", '~> 0.3'
```

# Usage

This gem is a Rails 3+ compatible engine and now automatically includes all the view helper modules into `ActionView::Base`

This gem includes the following view helper modules in `social_buttons/view_helpers`:

* `Tweet`
* `Like`
* `Pinit` 
* `GooglePlus`

Using SocialButtons is as simple as adding a single method call to your views:

ERB example:
```erb
<%= tweet_button %>
<%= like_button(app_id) %>
<%= pinit_button %>
<%= google_plus_button %>
```

HAML example:

```haml
= tweet_button
= like_button(app_id)
= pinit_button
= google_plus_button
```

Bam. Done. You'll have a sweet lookin' Social Buttons all up in your view.

Of course, you can customize it. Depending on the type of button, there are different options.

### Tweet Button

* `:url` - The URL to share; the default is the current URL.
* `:text` - The text that will appear in the tweet; the default is "Check this out!"
* `:via` - The attribution.  Defaults to "tweetbutton", but you should change that.
* `:lang` - Set the language for the tweet (no default).
* `:related` - Related Twitter accounts (no default).
* `:count` - The tweet count box position (values can be "none", "horizontal", or "vertical"; default is "vertical").

More information can be found from [Twitter](https://twitter.com/about/resources/buttons#tweet)

So, if you wanted to tweet about Hacker News, attribute it to Peter Cooper, and add some custom text, all from a tweet button with a horizontal counter, you'd do this:

```erb
<%= tweet_button(via: => "peterc", url: "http://news.ycombinator.com", :text => "AWESOME.") %>
```

### Like Button

NOTE: Facebook App Id is mandatory

* `:href` - The URL to like, the default is the current URL.
* `:send` - Whether to add a send button or not.
* `:layout` - Size and amount of social context next to button. Has 3 options `:standard`, `:button_count`, and `:box_count`
* `:width` - Width of the button
* `"show-faces"` - Show profile photos
* `:action` - Action name like 'like' or 'recommend'
* `:font` - Font for the button
* `:colorscheme` - Current colorscheme

More information can be found from [Facebook](http://developers.facebook.com/docs/reference/plugins/like/)

So, a simple like button can be added like this:

```erb
<%= like_button(app_id) %>
```

### Pinit Button

* `:url` - The URL to share; the default is the current URL.
* `:media` - The image to be shared.
* `:description` - Description for the link.
* `"count-layout"` - Specify pinit count. It can be `horizontal`, `vertical` or `none`.

More information can be found from [Pinterest](http://pinterest.com/about/goodies/)

So, a simple pinit button can be added like this:

```erb
<%= pinit_button(url: request.url, media: @picture.image.url, description: "Amazing Picture") %>
```

### Vkontakte like button

Before using you should include in the head:
`<script src="http://vkontakte.ru/js/api/openapi.js" type="text/javascript" charset="windows-1251"></script>`

* `:appId` - AppIp of your application or site
* `:type` - full, button, mini, vertical, vertical by default
* `:width` - only if full. Should be > 200
* `:height` - only 18, 20, 22, 24
* `:verb` - 0 or 1

See [Vk like](http://vk.com/pages?oid=-1&p=%D0%94%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F_%D0%BA_%D0%B2%D0%B8%D0%B4%D0%B6%D0%B5%D1%82%D1%83_%D0%9C%D0%BD%D0%B5_%D0%BD%D1%80%D0%B0%D0%B2%D0%B8%D1%82%D1%81%D1%8F) for more info

### Google Plus Button

* `:href` - The URL to share; the default is the current URL.
* `:size` - Size of button: 'small', 'tall' or 'medium'
* `:annotation` - The style of button: 'inline', 'bubble', 'none'
* `:lang` - The locale, fx 'es' for Spanish (alias :locale)

See [Google+ button](http://www.google.com/intl/en/webmasters/+1/button/index.html) for more info.

### Setting universal defaults

You can set a new default for any option in your `social_buttons.rb` initializer (in `config/initializers`.

Set the `default_options` on any of the social view helper modules.

For example:

```ruby
# config/initializers/social_buttons.rb
SocialButtons::Tweet.default_options = {:via => "myself"}
```

Or even sweeter...

```ruby
# config/initializers/social_buttons.rb
SocialButtons.config :tweet do |tweet|
  tweet.default_options = {:via => "myself"}
end

# or
SocialButtons.config(:tweet).default_options = {:via => "myself"}
```

Or simply :)

```ruby
# config/initializers/social_buttons.rb
SocialButtons.config do |social|
  social.tweet do |tweet|    
    tweet.default_options = {:via => "myself"}
  end

  social.like.default_options = {:via => "myself"}
  end
end
```

This little DSL makes the configuration more extensible for the future ;)

Only the options you specify will be overridden; so if you only specify a new default `:via`, then the other defaults will stay intact.

## Help

We have started adding suport for help directly in the api:

`puts SocialButtons.config(:google_plus).help`

Should output some help info on how to use that particular method, options available etc. So far only works for Google+ button.

# TODO

* Improve specs
* Add more options to customize buttons (fx localization on all if available)
* Add even more social buttons...

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Kristian Mandrup & Yuva Kumar
Copyright (c) 2010 Jeremy McAnally. 

See LICENSE for details.
