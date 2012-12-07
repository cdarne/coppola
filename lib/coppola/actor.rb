require "httparty"

module Coppola
  class Actor
    include HTTParty

    class << self
      attr_accessor :name
    end

    def self.build name, options, &block
      parent = self
      if options[:parent]
        actor = Coppola.actor_by_name(options[:parent])
        parent = actor if actor
      end
      klass = Class.new(parent) do
        instance_eval(&block) if block_given?
      end
      klass.name = name
      klass
    end
  end
end