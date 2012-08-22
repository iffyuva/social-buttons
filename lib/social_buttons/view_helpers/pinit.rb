module SocialButtons
  module Pinit
    PINIT_CREATE_BUTTON = "http://pinterest.com/pin/create/button/"
    PINIT_BUTTON_IMAGE  = "http://assets.pinterest.com/images/PinExt.png"

    def pinit_button(options = {})
      params = default_options.merge(options)
      params.merge!(:class => "pin-it-button")

      query_string  = options_to_query_string(params)
      option_params = params.except(:url, :media, :description)
      pinit_link    = PINIT_CREATE_BUTTON + query_string

      html = "".html_safe
      html << link_to(pinit_link, option_params) do
        image_tag(PINIT_BUTTON_IMAGE, border: "0", title: "Pin It")
      end
      html << pinit_widgets_js_tag unless @pinit_widgetized
    end

    class << self
      attr_accessor :default_options
    end

    def default_options
      options = {
        url:    request.url,
        media:  request.url,
        description: "Pin Me!"
      }.merge("count-layout" => "none")

      options.merge(SocialButtons::Pinit.default_options || {})
    end

    def pinit_widgets_js_tag
      @pinit_widgetized = true

      pinit_js = "https://assets.pinterest.com/js/pinit.js"
      "<script src=#{pinit_js} type='text/javascript'></script>".html_safe
    end

    def options_to_query_string(opts)
      # formulate the url, and then strip the part before first '?'
      query_params = opts.slice(:url, :media, :description)
      full_url = url_for(query_params)
      full_url.sub(/^([^?]*)/, '')
    end
  end
end