module Coppola
  module Syntax
    def define(&block)
      DSL.run(block)
    end

    class DSL
      def scenario name, options={}, &block
        Coppola.register_scenario(Scenario.new(name, options, &block))
      end

      def scene name, options={}, &block
        Coppola.register_scene(Scene.new(name, options, &block))
      end

      def actor name, options={}, &block
        Coppola.register_actor(Actor.build(name, options, &block))
      end

      def self.run(block)
        new.instance_eval(&block)
      end
    end
  end

  extend Syntax
end