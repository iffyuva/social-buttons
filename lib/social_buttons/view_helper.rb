module SocialButtons
  module ViewHelper
    SocialButtons.names.each do |name|
      self.send :include, "SocialButtons::#{name.to_s.camelize}".constantize
    end        
  end
end