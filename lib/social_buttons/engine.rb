module SocialButtons
  module Rails
    class Engine < ::Rails::Engine
      initializer 'social buttons config' do       
        ActionView::Base.send :include, SocialButtons::ViewHelper
      end
    end
  end
end