module Coppola
  class << self
    # An Array of strings specifying locations that should be searched for
    # factory definitions. By default, factory_girl will attempt to require
    # "factories," "test/factories," and "spec/factories." Only the first
    # existing file will be loaded.
    attr_accessor :definition_file_paths
  end

  self.definition_file_paths = %w(coppola)

  def self.find_definitions
    absolute_definition_file_paths = definition_file_paths.map {|path| File.expand_path(path) }

    absolute_definition_file_paths.uniq.each do |path|
      load("#{path}.rb") if File.exists?("#{path}.rb")

      if File.directory? path
        Dir[File.join(path, '**', '*.rb')].sort.each do |file|
          load file
        end
      end
    end
  end
end