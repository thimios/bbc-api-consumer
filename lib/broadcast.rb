class Broadcast
  attr_reader :title, :subtitle, :start, :pid

  def dab_text
    "#{self.title} #{self.subtitle}"
  end

  def initialize(title, subtitle, start, pid)
    @title = title
    @subtitle = subtitle
    @start = start
    @pid = pid
  end
end
