module SocialButtons
  # autoload :Assistant, 'social_buttons/view_helpers/assistant'
  
  [SocialButtons.names << :assistant].flatten.each do |name|
    autoload name.to_s.camelize.to_sym, "social_buttons/view_helpers/#{name}"
  end

  module ViewHelper
    # Include all Social Buttons into ViewHelper to be made available 
    # to be included into a View as one module (see engine)
    SocialButtons.names.each do |name|
      self.send :include, "SocialButtons::#{name.to_s.camelize}".constantize
    end        
  end
end