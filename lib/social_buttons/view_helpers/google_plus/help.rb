module SocialButtons
  module GooglePlus
    module Help
      # Usage 
      #   SocialButtons::Google.help
      #
      #   SocialButtons.config(:google).help
      def help
        %Q{Google+ button (options)
#{Help.show_data_attributes}
#{Help.other_options}
#{Help.async_help}
#{help_note}
}
      end

      module Help
        def show_data_attributes
          "'data-' attributes: #{data_attributes.inspect}"
        end

        def other_options
          "options: lang"
        end

        def data_attributes
          %w{size href annotation}
        end

        def async_help
%q{Async script mode:
  To only output script
    = google_button :script, lang: 'es'

  To NOT output script tag
    = google_button :lang => 'es', script: false
}
        end
      end 
    end
  end
end