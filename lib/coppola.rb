require 'coppola/version'

require 'coppola/registry'

require 'coppola/actor'
require 'coppola/configuration'
require 'coppola/scene'
require 'coppola/syntax'

require 'coppola/find_definitions'
require 'coppola/reload'


module Coppola
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset_configuration
    @configuration = nil
  end

  class << self
    extend Forwardable
    def_delegators :configuration, :scenarii, :scenes, :actors
  end

  def self.register_scenario(scenario)
    scenarii.register(scenario.name, scenario)
    scenario
  end

  def self.scenario_by_name(name)
    scenarii.find(name)
  end

  def self.register_scene(scene)
    scenes.register(scene.name, scene)
    scene
  end

  def self.scene_by_name(name)
    scenes.find(name)
  end

  def self.register_actor(actor)
    actors.register(actor.name, actor)
    actor
  end

  def self.actor_by_name(name)
    actors.find(name)
  end
end