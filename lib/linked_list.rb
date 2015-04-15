# Element Reference — Returns the element at index, or returns a subarray starting at the start index and continuing for length elements, or returns a subarray specified by range of indices.

# Element Reference — Returns the element at index, or returns a subarray starting at the start index and continuing for length elements, or returns a subarray specified by range of indices.

# Negative indices count backward from the end of the array (-1 is the last element). For start and range cases the starting index is just before an element. Additionally, an empty array is returned when the starting index for an element range is at the end of the array.

# Returns nil if the index (or starting index) are out of range.
# Negative indices count backward from the end of the array (-1 is the last element). For start and range cases the starting index is just before an element. Additionally, an empty array is returned when the starting index for an element range is at the end of the array.

# Returns nil if the index (or starting index) are out of range.
  # shorter way to write:
  # def size
  #   @size
  # end

require_relative 'linked_list_item'

class LinkedList

  def get(nth_item)
    if nth_item == 0
      @first_item.payload
    elsif nth_item < 0
      raise (IndexError)
    else
      count = 0
      current_node = @first_item
      while count < nth_item
        current_node = current_node.next_item
        count = count + 1
      end
      current_node.payload
    end
  end

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(item)
      @last_item = @last_item.next_item
    end
  end
end
