module SocialButtons
  module Like
    include SocialButtons::Assistant

    CLASS = "fb-like"

    def like_button(app_id, options = {})
      clazz = SocialButtons::Like
      params = clazz.options_to_data_params(clazz.default_options.merge(options))
      params.merge!(class: CLASS)

      html = "".html_safe
      html << content_tag(:div, nil, id: "fb-root")
      html << clazz.script(app_id)
      html << content_tag(:div, nil, params)
      html
    end

    # To avoid polluting namespace where module is included with util functions!
    class << self
      def default_options
        @default_options ||= {
          send:    "false",
          layout:  "button_count",
          width:   "450",
          action:  "like",
          font:    "arial",
          colorscheme: "light"
        }.merge("show-faces" => "false")
      end

      def script(app_id)
        return empty_content if widgetized?
        @widgetized = true        
        "<script src=#{js_sdk(app_id)} type='text/javascript'></script>".html_safe
      end

      def js_sdk app_id
        "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=#{app_id}"
      end
    end
  end
end