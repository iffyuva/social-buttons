module SocialButtons
  module Vkontakte
    include SocialButtons::Assistant

    def vkontakte_like appId, *args
      clazz = SocialButtons::Vkontakte
      options = args.extract_options!
      
      clazz.default_options.each { |k,v| options[k] ||= v }

      html = "".html_safe
      html << clazz::Scripter.new(self).init_js(appId)
      html << content_tag(:div, nil, id: "vk_like")
      html << clazz::Scripter.new(self).script(options)
      html
    end

    class << self
      def default_options
        @default_options ||= {
          width: '350',
          type: 'vertical',
          height: '22',
          verb: '0'
        }
      end      
    end

    class Scripter < SocialButtons::Scripter
      def init_js appId
        "<script type=\"text/javascript\"> VK.init({apiId: #{appId}, onlyWidgets: true}); </script>".html_safe
      end
      def script options = {}
        [
          "<script type=\"text/javascript\">",
          "VK.Widgets.Like(\"vk_like\", { type: \"#{options[:type]}\", width: '#{options[:width]}', verb: '#{options[:verb] }'});",
          "</script>"
        ].join.html_safe
      end
    end
  end
end
