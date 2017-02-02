class LocCounter
  attr_accessor :loc
  def initialize
    @loc = 0
  end

  def main(file)
    File.open(file, "r") do |f|
        f.each_line do |line|
          count_line(line)
        end
    end
    puts "El numero de lineas de codigo del archivo de ruby es: #{@loc}"
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

loc_counter = LocCounter.new
loc_counter.main(ARGV[0])
