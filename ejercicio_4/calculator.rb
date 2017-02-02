require('csv')
require_relative ("lista.rb")
require_relative ("file_manager.rb")

class Calculator
  attr_accessor :list_x, :list_y

  def main(file)
    f = FileManager.new
    @list_x =  List.new
    @list_y =  List.new
    CSV.foreach(f.getFile(file), headers: true) do |row|
      puts row['X']
      @list_x.add(row['X'].to_f)
      @list_y.add(row['Y'].to_f)
    end
    mean_x = calculate_mean(@list_x)
    mean_y = calculate_mean(@list_y)

    beta_uno = calculate_beta_uno(@list_x, @list_y, mean_x, mean_y)
    beta_cero = calculate_beta_cero(mean_x, mean_y, beta_uno)
    puts "La B0 es:#{beta_cero}"
    puts "La B1 es: #{beta_uno}"
  end

  def calculate_beta_uno(list_x, list_y, mean_x, mean_y)
    node_x = list_x.head
    node_y = list_y.head
    dividendo = 0
    divisor = 0
    n = list_x.size
    puts "--------------------------"
    while node_x && node_y
      value_dividendo = ((node_x.value * node_y.value))
      dividendo = dividendo + value_dividendo
      value_divisor = ( (node_x.value ** 2))
      divisor = divisor + value_divisor
      node_x = node_x.next
      node_y = node_y.next
    end

    dividendo = dividendo - (n * mean_x * mean_y)
    divisor = divisor - ( n * (mean_x ** 2))

    beta_uno = dividendo / divisor
  end

  def calculate_beta_cero(mean_x, mean_y, beta_uno)
    beta_cero = mean_y - (beta_uno * mean_x)
  end

  def calculate_mean(list)
    node = list.head
    sum = 0
    while node
      sum = sum + node.value
      node = node.next

    end
    sum = sum / list.size
  end

  def calculate_std(list, mean)
    sum = 0
    node = list.head

    while node
      dif = node.value - mean
      sum += dif**2
      node = node.next
    end
    std = Math.sqrt(sum/(list.size-1))
    std = std.round(2)
  end

end
