module SocialButtons
  module Pinit
    include SocialButtons::Assistant

    PINIT_CREATE_BUTTON = "http://pinterest.com/pin/create/button/"
    PINIT_BUTTON_IMAGE  = "http://assets.pinterest.com/images/PinExt.png"
    CLASS = "pin-it-button"
    TITLE = "Pin It"

    def pinit_button(options = {})
      clazz = SocialButtons::Pinit
      default_options = {url: request.url, media: request.url}
      params = clazz.default_options.merge(clazz.default_options).merge(options)
      params.merge!(:class => CLASS)

      query_string  = clazz.options_to_query_string(self, params)
      option_params = params.except(:url, :media, :description)
      pinit_link    = PINIT_CREATE_BUTTON + query_string

      html = "".html_safe
      html << link_to(pinit_link, option_params) do
        image_tag PINIT_BUTTON_IMAGE, border: ("0" || options[:border]), title: (TITLE || options[:title])
      end
      html << clazz.script
      html
    end

    class << self
      def default_options
        @default_options ||= {
          description: "Pin Me!"
        }.merge("count-layout" => "none")
      end

      def script
        return empty_content if widgetized?
        @widgetized = true        
        "<script src=#{pinit_js} type='text/javascript'></script>".html_safe
      end

      def pinit_js
        "https://assets.pinterest.com/js/pinit.js"
      end
    end
  end
end