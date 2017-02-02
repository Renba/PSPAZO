class Node
  attr_accessor :next, :value
  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end
end

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

class Calculator
  attr_accessor :list

  def main(file)
    @list =  List.new
    File.open(file, "r") do |f|
      f.each_line do |line|
        @list.add(line.to_f)
      end
    end
    mean = calculate_mean

    puts "La media es:#{mean}"
    puts "La desviación estandar es:#{calculate_std(mean)}"
  end

  def calculate_mean
    node = @list.head
    sum = 0
    while node
      sum = sum + node.value
      node = node.next

    end
    sum = sum / @list.size
  end

  def calculate_std(mean)
    sum = 0
    node = @list.head

    while node
      dif = node.value - mean
      sum += dif**2
      node = node.next
    end
    std = Math.sqrt(sum/(@list.size-1))
    std = std.round(2)
  end
end

calc = Calculator.new
calc.main(ARGV[0]);
