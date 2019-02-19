require 'yaml'

class FrameFetcher
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def call
    frame
  end

  private

  def frame
    return unless path && File.exist?(path)
    YAML.safe_load(File.open(path))
  end

  def path
    @path ||= Dir["data/#{id}_*.json"].first
  end
end
