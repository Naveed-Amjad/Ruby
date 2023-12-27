# require 'csv'
# require 'date'
# CSV.read("Dubai_weather/Dubai_weather_2004_Aug.txt")

# table = CSV.parse(File.read("Dubai_weather/Dubai_weather_2004_Aug.txt"), headers: true);
# max_tempratures = table.by_col[1].map(&:to_i)

# max_temp = max_tempratures.max

# puts "Max temrature = #{max_temp}"

# CSV.foreach(("Dubai_weather/Dubai_weather_2004_Aug.txt"), headers: true, col_sep: ",") do |row|
#     puts row 
# end 

# # Example: Get all Ruby files in the current directory
# filenames = Dir.glob("./*.txt")

# # Display the filenames
# puts filenames

# @address = "Dubai_weather/*.txt"
# filenames = Dir.glob(@address)

# Display the filenames
# puts filenames

# tem_array = []
# min_array = []

# filenames.each do |filename|
#     table = CSV.parse(File.read(filename), headers: true)
#     date_string = table[0][0];
#     parsed_date = Date.parse(date_string)
#     month_name = parsed_date.strftime('%B')
#     # Now you can work with the CSV data in the 'table' variable
#     # For example, you can access columns using headers:
#     max_temperatures = table.by_col[1].map(&:to_i)
#     min_tempratures = table.by_col[3].map(&:to_i)
#     sum = 0
#     min_sum = 0
#     max_temperatures.each do |temp|
#         sum = sum + temp
#     end
#     min_tempratures.each do |temp|
#         min_sum = min_sum + temp
#     end
#     puts "Average Max temprature in #{month_name} is #{sum/max_temperatures.length}"
#     puts "Average Min temprature in #{month_name} is #{min_sum/min_tempratures.length}"

#     max_temp = max_temperatures.max
#     min_temp = min_tempratures.min
#     tem_array.push(max_temp);
#     min_array.push(min_temp)
#     puts "Max temperature in #{filename}: #{max_temp} \n"
#     puts "Min temperature in #{filename}: #{min_temp} \n"

#   end

# max = tem_array.max
# max, max_index = tem_array.each_with_index.max

# min = min_array.min

#   puts "Temp Array = #{tem_array} \n\n"
#   puts "Max Temprature from all the files = #{max}\n"

#   puts "Min Array = #{min_array} \n\n"
#   puts "Min Temprature from all the files = #{min}\n"

# Reading file names from command line

# @address = "Dubai_weather/Dubai_weather_#{ARGV[0]}"
# puts "address = #{@address}"
# filenames = Dir.glob(@address)

# filenames.each do |file_path|
#     # Extract the file name from the path
#     file_name = File.basename(file_path)
  
#     # Split the file name using '/'
#     parts = file_name.split('/')
  
#     # The last part of the split will be the desired part
#     desired_part = parts.last
  
#     # Now you can use desired_part as needed
#     puts "Desired Part: #{desired_part}"

#     file_content = File.read(@address)

#     # Parse the content into a CSV table
#     csv_table = CSV.parse(file_content, headers: true)

#     # Now you can use csv_table as needed
#     puts "CSV Table for #{csv_table}:"

#     csv_table.each do |row|
#         # Access individual columns using column names
#         max_temp = row['Max TemperatureC'].to_i
#         min_temp = row['Min TemperatureC'].to_i
#         date = row['GST']
#         dateObj = Date.parse(date)
#         day = dateObj.day
#         if(max_temp && min_temp)
#             puts "Day = #{day}"
#         end
#         if max_temp
#             (1..max_temp).each do
#               print "+"
#             end
#             puts "#{max_temp}"
#         end
        
#         if min_temp
#             (1..min_temp).each do
#               print "+"
#             end
#             puts "#{min_temp}"
#         end
#         puts " "
#         # puts "Max value = #{max_temp}"
#         # puts "Max value = #{min_temp}"
#         # puts "Max value = #{date}"
#     end


# 
require 'csv'
require 'date'

class WeatherDataProcessor
  def initialize(address)
    @address = address
    @tem_array = []
    @min_array = []
  end

  def process_weather_data
    filenames = @address

    filenames.each do |filename|
      table = CSV.parse(File.read(filename), headers: true)
      date_string = table[0][0]
      parsed_date = Date.parse(date_string)
      month_name = parsed_date.strftime('%B')

      max_temperatures = table.by_col[1].map(&:to_i)
      min_tempratures = table.by_col[3].map(&:to_i)

      sum = max_temperatures.sum
      min_sum = min_tempratures.sum

      puts "Average Max temperature in #{month_name} is #{sum / max_temperatures.length}"
      puts "Average Min temperature in #{month_name} is #{min_sum / min_tempratures.length}"

      max_temp = max_temperatures.max
      min_temp = min_tempratures.min

      @tem_array.push(max_temp)
      @min_array.push(min_temp)

      puts "Max temperature in #{filename}: #{max_temp}"
      puts "Min temperature in #{filename}: #{min_temp}"
      puts "\n"
    end
  end

  def task_1
    filenames = Dir.glob(@address)

    filenames.each do |filename|
      table = CSV.parse(File.read(filename), headers: true)
      date_string = table[0][0]
      parsed_date = Date.parse(date_string)
      month_name = parsed_date.strftime('%B')

      max_temperatures = table.by_col[1].map(&:to_i)
      min_tempratures = table.by_col[3].map(&:to_i)

      sum = max_temperatures.sum
      min_sum = min_tempratures.sum

      puts "Average Max temperature in #{month_name} is #{sum / max_temperatures.length}"
      puts "Average Min temperature in #{month_name} is #{min_sum / min_tempratures.length}"
      puts "\n"
    end
  end

  def task_2
    max = @tem_array.max
    max, max_index = @tem_array.each_with_index.max

    min = @min_array.min

    puts "Max Temperature from all the files: #{max}"
    puts "\n"
    puts "Min Temperature from all the files: #{min}"
  end

  def task_3
    process_weather_data
  end
end

# Example usage:
# address = "Dubai_weather/*.txt"
puts ARGV
puts "_____________________________________"
address = ARGV[0..-2]
puts "Address = #{address}"
weather_processor = WeatherDataProcessor.new(address)

# Get the command-line argument
task = ARGV[-1]
puts "task = #{task}"

# Use a case statement to execute the corresponding method based on the input
case task
when 'task1'
  weather_processor.task_1
when 'task2'
  weather_processor.task_3  # Call task_3 to process weather data first
  weather_processor.task_2  # Then call task_2 to display results
when 'task3'
  weather_processor.task_3
else
  puts "Invalid task. Please use 'task1', 'task2', or 'task3'."
end

