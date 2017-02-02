class Node
  attr_accessor :next, :value
  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end
end
