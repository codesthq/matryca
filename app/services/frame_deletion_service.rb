class FrameDeletionService
  attr_reader :id
  def initialize(id)
    @id = id
  end

  def call
    File.delete(Dir.glob("data/#{id}?.json").first)
  end
end
