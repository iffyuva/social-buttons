require 'view_helper_config'

describe SocialButtons::ViewHelper do
  include ControllerTestHelpers,
          SocialButtons::ViewHelper

  describe '#like_button' do
    context 'no arguments' do
      it "should require a Facebook app id" do
        expect { like_button }.to raise_error
      end
    end

    context 'with app_id' do
      it "should require a Facebook app id" do
        expect { like_button('128085897213395') }.to_not raise_error
      end
    end

    context 'with options' do
      it "should set width using option" do
        output = like_button('128085897213395', :width => '400')
        output.should match(/width="400"/)
      end
    end
  end
end