puts 'Welcome to the file reader'
puts 'Please enter the filename to read:'
filename = gets.chomp
puts 'Please enter the pattern to match:'
filepattern = gets.chomp

File.foreach(filename) do |line|
  puts "#{$.} #{line}" if /#{filepattern}/.match(line) 
end

#file = File.open(filename)
#file_data = file.readlines.map(&:chomp)
#file.close
