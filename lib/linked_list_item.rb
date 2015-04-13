class LinkedListItem
  include Comparable

  attr_reader :payload

  def initialize(data)
    @payload = data
  end
end
