module SocialButtons
  module Rails
    class Engine < ::Rails::Engine
      initializer 'social buttons config' do 
        SocialButtons.buttons.each do |name|
          ActionView::Base.send :include, SocialButtons::ViewHelper
        end        
      end
    end
  end
end