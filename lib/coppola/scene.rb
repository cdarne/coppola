require "benchmark"

module Coppola
  class Scene
    attr_reader :name

    def initialize name, options, &block
      @name = name
      @block = block
    end

    def run(actor)
      puts "Running scene '#{name}'..."
      resp = nil
      time = Benchmark.realtime do
        resp = @block.call(actor)
      end
      puts "Scene '#{name}' finished in #{time} seconds"
      resp
    end
  end
end