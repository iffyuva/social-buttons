module SocialButtons
  module GooglePlus
    include SocialButtons::Assistant

    autoload :Help, "social_buttons/view_helpers/google_plus/help"

    CLASS = "g-plusone"

    # http://www.google.com/intl/en/webmasters/+1/button/index.html

    # Async script mode:
    #   To only output script
    #   = google_button :script, lang: 'es'

    #   To NOT output script
    #   = google_button :lang => 'es', script: false
    def google_plus_button *args
      options = args.extract_options!
      clazz = SocialButtons::GooglePlus
      return clazz.script(options) if args.first == :script

      params = clazz.options_to_data_params(clazz.default_options.merge(options))
      params.merge!(class: CLASS)

      script_context = options[:script] == :async ? clazz::Async : clazz

      html = "".html_safe
      html << content_tag(:div, params)
      html << script_context.script(options[:lang]) if options[:script]
      html
    end

    class << self
      include Help

      def default_options
        @default_options ||= {
          annotations:    "inline"
        }
      end

      module Async
        # Place this tag in your head or just before your close body tag
        def script lang = nil
          %Q{<script type="text/javascript" src="https://apis.google.com/js/plusone.js">
            #{language lang}
          </script>}
        end

        def language lang = nil
          "{lang: '#{lang}'}" if lang
        end
      end

      def script lang = nil
        return empty_content if widgetized?
        @widgetized = true
        %q{<script type="text/javascript">
          #{language lang}
    (function() {
      var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
      po.src = 'https://apis.google.com/js/plusone.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
    })();
        </script>}.html_safe
      end

      def language lang = nil
        "window.___gcfg = {lang: '#{lang}'};" if lang
      end     
    end
  end
end
