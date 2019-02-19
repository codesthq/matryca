class FrameDeletionService
  attr_reader :id
  def initialize(id)
    @id = id
  end

  def call
    delete_frame
  end

  private

  def delete_frame
    return unless path && File.exist?(path)
    File.delete(path)
    true
  end

  def path
    @path ||= Dir.glob("data/#{id}*.json").first
  end
end
