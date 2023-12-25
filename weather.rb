require 'csv'
require 'date'
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

@address = "Dubai_weather/*.txt"
filenames = Dir.glob(@address)

# Display the filenames
# puts filenames

tem_array = []
min_array = []

filenames.each do |filename|
    table = CSV.parse(File.read(filename), headers: true)
    date_string = table[0][0];
    parsed_date = Date.parse(date_string)
    month_name = parsed_date.strftime('%B')
    # Now you can work with the CSV data in the 'table' variable
    # For example, you can access columns using headers:
    max_temperatures = table.by_col[1].map(&:to_i)
    min_tempratures = table.by_col[3].map(&:to_i)
    sum = 0
    min_sum = 0
    max_temperatures.each do |temp|
        sum = sum + temp
    end
    min_tempratures.each do |temp|
        min_sum = min_sum + temp
    end
    puts "Average Max temprature in #{month_name} is #{sum/max_temperatures.length}"
    puts "Average Min temprature in #{month_name} is #{min_sum/min_tempratures.length}"

    max_temp = max_temperatures.max
    min_temp = min_tempratures.min
    tem_array.push(max_temp);
    min_array.push(min_temp)
    puts "Max temperature in #{filename}: #{max_temp} \n"
    puts "Min temperature in #{filename}: #{min_temp} \n"

  end

# max = tem_array.max
max, max_index = tem_array.each_with_index.max

min = min_array.min

  puts "Temp Array = #{tem_array} \n\n"
  puts "Max Temprature from all the files = #{max}\n"

  puts "Min Array = #{min_array} \n\n"
  puts "Min Temprature from all the files = #{min}\n"