require 'csv'
require 'rubygems'
require 'zip'
require_relative 'write_file'
class CsvUnzip

   def csv_unzip (file, destination)
      Zip::File.open(file) do |zip_file|
         zip_file.each do |f|
            f_path = File.join(destination, f.name)
            FileUtils.mkdir_p(File.dirname(f_path))
            f.extract(f_path)unless File.exist?(f_path)
            @url=f
         end
      end
      url="#{@url}"
      i=1
      @arraysort=[]
      CSV.foreach(url) do |row| 
         @arraysort << row[1]
         i=i+1
         if (i==1000) 
            break
         end
      end
      # puts ($ar)
      File.open("tempunzip", 'w') { |file| file.puts(@arraysort) }
   end 

   def returnUnzipList
    return @arraysort
   end    
end

@listUnzip=CsvUnzip.new
@listUnzip.csv_unzip("top.zip", "/home/user/urlDownloadInOrder")
@listUnzipBody=@listUnzip.returnUnzipList


@write=WriteFile.new
@write.write_file("unzipList",@listUnzipBody)



