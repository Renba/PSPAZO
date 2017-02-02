require_relative("node.rb")

class List
 attr_accessor :head, :size

  def initialize(value = nil)
    @size = 1;
  end

  def add(value = nil)
    if is_number?(value)
      if @head
        node = Node.new(value, @head)
        @head = node
        @size += 1
      else
        @head = Node.new(value)
      end
    end
  end

  def is_number?(value)
    true if Float(value) rescue false
  end
end
