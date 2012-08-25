require 'view_helper_config'

describe SocialButtons::ViewHelper do
  include ControllerTestHelpers,
          SocialButtons::ViewHelper

  describe '#google_plus_button' do
    context 'no arguments' do
      it "should not any args" do
        expect { google_plus_button }.to_not raise_error
      end
    end

    context 'with options' do
      it "should set annotation using option" do
        output = google_plus_button(:annotation => 'bubble')
        output.should match(/bubble/)
      end
    end
  end
end