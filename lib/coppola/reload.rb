module Coppola
  def self.reload
    reset_configuration
    find_definitions
  end
end