module SocialButtons
  def self.names
    %w{pinit tweet like}
  end

  def self.config name = nil, &block 
    context = name ? "SocialButtons::#{name.to_s.camelize}".constantize : self
    block_given? ? yield(context) : context
  end

  # add class method for each social button registered
  names.each do |name|
    (class << self; self; end).send :define_method, name do |&block|      
      clazz = "SocialButtons::#{name.to_s.camelize}".constantize
      block_given? ? clazz.instance_eval(&block) : clazz
    end
  end
end

SocialButtons.names.each do |name|
  require "social_buttons/view_helpers/#{name}"
end

require "social_buttons/view_helper"
require "social_buttons/engine" if defined?(::Rails::Engine)