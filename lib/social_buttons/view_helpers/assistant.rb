module SocialButtons
  module Assistant
    extend ActiveSupport::Concern

    module ClassMethods
      attr_reader :widgetized      
      attr_writer :default_options
      alias_method :widgetized?, :widgetized

      def myname
        self.name.demodulize
      end

      def help
        "Please HELP by filling in the help of the #{myname} button :) (see google+ button code)"
      end 

      def options_to_data_params(opts)
        params = {}
        opts.each {|k, v| params["data-#{k}"] = v}
        params
      end

      def options_to_query_string(subject, opts)
        # formulate the url, and then strip the part before first '?'
        query_params = opts.slice(:url, :media, :description)
        full_url = subject.url_for(query_params)
        full_url.sub(/^([^?]*)/, '')
      end

      protected

      def help_note
        "Note: SocialButons will ensure that the button script is only rendered once!"
      end

      def empty_content
        "".html_safe
      end
    end
  end
end
