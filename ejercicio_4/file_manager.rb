class FileManager
attr_accessor :file
  def getFile(file)
    @file = file
    if @file.end_with?('.csv')
      return @file;
    else
      return @file.strip + '.csv';
    end
  end

end
