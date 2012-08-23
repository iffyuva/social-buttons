require 'spec_helper'

describe SocialButtons do

  # TODO: Generate for each!
  # SocialButtons.names.each do |name|
  context 'Tweet' do
    subject { SocialButtons::Tweet }

    describe 'Tweet' do
      before :all do
        SocialButtons::Tweet.default_options = {:via => "myself"}
      end

      its(:default_options) { should == {:via => "myself"} } 
    end

    describe '#config' do
      before :all do
        SocialButtons.config(:tweet).default_options = {:via => "myself"}
      end

      its(:default_options) { should == {:via => "myself"} } 
    end

    describe '#config &block' do
      before :all do
        SocialButtons.config(:tweet) {|c| c.default_options = {:via => "myself"} }
      end

      its(:default_options) { should == {:via => "myself"} } 
    end
  end
end