require_relative 'linked_list_item'

class LinkedList
  attr_reader :size

  def initialize(*args) #* args will always be an array and globs everything together
    @size = 0
    args.each do |payload|
      push(payload)
    end
  end

  def get_item(index)
    raise IndexError if index < 0
    if index == 0
      @first_item
    else
      current_node = @first_item
      index.times do #loop
        raise IndexError if current_node.nil? or current_node.last?
        current_node = current_node.next_item
      end
      current_node
    end
  end

  def get(index)
    get_item(index).payload
  end

  # def [](index)
  #   get(index)
  # end

  #another way to write this using alias
  alias [] get

  def []=(index, payload)
    if index == 0
      current_item = @first_item
    else
      previous_item = get_item(index - 1)
      current_item = previous_item.next_item
    end

    new_item = LinkedListItem.new(payload)
    next_item = current_item.next_item
    new_item.next_item = next_item

    if index == 0
      @first_item = new_item
    else
      previous_item.next_item = new_item
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

  def delete(index)
    raise IndexError if @first_item.nil? || index < 0
    @size -= 1
    current_node = @first_item
    if index > 0
      (index - 1).times do
        current_node = current_node.next_item
      end
       current_node.next_item = current_node.next_item.next_item
    elsif index <= 0
      @first_item = current_node.next_item
    end
  end

  def to_s
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload
      punctuation = current_item.last? ? " " : ", "
      str << punctuation
      current_item = current_item.next_item
    end
    str << "|"
    str
  end
end