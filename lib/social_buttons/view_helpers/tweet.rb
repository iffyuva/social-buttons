module SocialButtons
  module Tweet
    include SocialButtons::Assistant

    TWITTER_SHARE_URL = "http://twitter.com/share"
    CLASS = "twitter-share-button"

    def tweet_button(options = {})
      clazz = SocialButtons::Tweet
      params = clazz.options_to_data_params(clazz.default_options.merge(options))
      params.merge!(class: CLASS)

      html = "".html_safe
      html << clazz.script
      html << link_to("Tweet", TWITTER_SHARE_URL, params)
      html
    end

    class << self
      def default_options
        @default_options ||= {
          url:    request.url,
          via:    "tweetbutton",
          text:   "",
          count:  "vertical",
          lang:   "en",
          related: ""
        }
      end

      def script
        return empty_content if widgetized?
        @widgetized = true        
        
        "<script src=#{twitter_wjs} type='text/javascript'></script>".html_safe
      end

      def twitter_wjs 
        "http://platform.twitter.com/widgets.js"
      end
    end # class
  end
end