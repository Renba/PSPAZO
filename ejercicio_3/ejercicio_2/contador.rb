class LocCounter
  attr_accessor :loc
  def initialize
    @loc = 0
  end

  def main(ruta)
    Dir.foreach(ruta) do |item|
      puts item
      if item.end_with?('.rb')
        read_file(ruta +"/"+ item)
      end
    end
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

end
