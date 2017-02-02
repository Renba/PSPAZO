class LocCounter
  attr_accessor :loc, :class_list, :current_class
  def initialize
    @loc = 0
    @class_list = {}
    @current_class = nil
  end

  def main(ruta)
    Dir.foreach(ruta) do |item|
      puts item
      if item.end_with?('.rb')
        read_file(ruta +"/"+ item)
        read_class(ruta + "/"+ item)
      end
    end
    p "mis classes: #{@class_list}"
    puts "El numero de lineas de codigo del programa es: #{@loc}"
  end

  def read_file(file)
    File.open(file, "r") do |f|
        f.each_line do |line|
          count_line(line)
        end
    end
  end

  def count_line(line)
    if line  =~ /^#/
      @loc = @loc
    elsif line =~ /^\s*$/
      @loc = @loc
    else
      @loc = @loc + 1
    end
  end

  def read_class(file)
    @current_class = nil
    File.open(file, "r") do |f|
        f.each_line do |line|
           count_class(line, file)
        end
    end
  end

  def count_class(line,file)
    if line.start_with?('class')
      @current_class = line[6,100].delete(' ')

      @class_list[@current_class] = {loc: 0, num_methods: 0}
    end
    count_lines_class(line, @current_class)
  end

  def count_lines_class(line, name_class)
    if name_class.to_s != ""
      unless line =~ /^#/ || line =~ /^\s*$/
        if line.strip.start_with?('def')
          @class_list[name_class][:num_methods] += 1
        else
          @class_list[name_class][:loc] += 1
        end
      end
    end
  end

end
