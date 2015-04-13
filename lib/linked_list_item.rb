class LinkedListItem
  include Comparable


  attr_reader :payload
  def initialize(payload)
    @payload = payload
  end

  attr_reader :next_item
  def next_item=(following_item)
    raise ArgumentError if following_item === self
    @next_item = following_item
  end

end
