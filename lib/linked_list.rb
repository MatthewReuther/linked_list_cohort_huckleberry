require_relative 'linked_list_item'

class LinkedList
  attr_reader :size

  def initialize
    @size = 0
  end

  def get(index)
    raise IndexError if index < 0
    if index == 0
      @first_item.payload
    else
      current_node = @first_item
      index.times do
        raise IndexError if current_node.nil? or current_node.last?
        current_node = current_node.next_item
      end
      current_node.payload
    end
  end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  def push(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
    else
      @last_item.next_item = new_item
    end
    @size += 1
    @last_item = new_item
  end
end



