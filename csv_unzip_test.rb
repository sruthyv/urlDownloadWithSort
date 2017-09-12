require "minitest/autorun" 
require_relative "csv_unzip"
class CsvUnzipTest < Minitest::Test
    def setup
        @unzipfile=CsvUnzip.new
        @unzipfile.csv_unzip("top.zip", "/home/user/urlDownloadInOrder")

    end 
    def test_is_file_unzipped  
        assert File.exist?("/home/user/urlDownloadInOrder/top-1m.csv"),true
    end
end