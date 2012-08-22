require 'view_helper_config'

describe SocialButtons::ViewHelper do
  include ControllerTestHelpers,
          SocialButtons::ViewHelper

  describe '#tweet_button' do
    context 'no arguments' do
      it "should not any args" do
        expect { tweet_button }.to_not raise_error
      end
    end

    context 'with options' do
      it "should set description using option" do
        output = tweet_button(:text => 'hello')
        output.should match(/hello/)
      end
    end
  end
end