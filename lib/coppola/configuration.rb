module Coppola
  class Configuration
    attr_reader :scenarii, :scenes, :actors

    def initialize
      @scenarii = Registry.new("Scenario")
      @scenes = Registry.new("Scene")
      @actors = Registry.new("Actor")
    end
  end
end