class LinkedListItem
  include Comparable

  attr_reader :payload
  attr_reader :next_item

  def initialize(data)
    @payload = data
  end

  def next_item=(lli)
    raise ArgumentError, "can't next_item to self" if self == lli
    @next_item = lli
  end

    def last?
    next_item.nil?
  end

  #  self less than other => -1
  #  self equal to other => -
  #  self greater than other => 1
  def <=> (other)
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    end
    # class_precedence = [Fixnum, String, Symbol]
    # Option 1:
    self.payload.class.to_s <=> other.payload.class.to_s

    # Option 2:
      # if self.payload.is_a? Symbol
      #   1
      # elsif self.payload.is_a? Fixnum
      #   -1
      # else # I mist be a String
      #   if other.payload.is_a? Symbol
      #     -1
      #   else
      #     1
      #   end
      # end

    # Option 3:
      # if self.payload.is_a? Symbol
      #   1
      # elsif self.payload.is_a? Fixnum
      #   -1
      # else # I must be a String
      #  -1 * (other <=> self)
      # end

    # Option 4:
      # class_precedence = [Fixnum, String, Symbol]
      # left_precedence = class_precedence.inex(self.payload.class)
      # right_precedence = class_precedence.inex(other.payload.class)
      # left_precedence <=> right_precedence
  end

  def === (other)
    self.equal? other
    # self.object_id == other.object_id
  end
end

