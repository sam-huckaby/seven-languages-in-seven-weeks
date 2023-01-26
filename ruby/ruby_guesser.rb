solution = rand(10)
guess = nil

puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
puts '~~~ Welcome to Ruby Guesser! ~~~'
puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

while guess != solution
  puts "Enter your guess: "
  guess = gets.chomp.to_i
  
  puts 'That guess is too low' if guess < solution
  puts 'That guess is too high' if guess > solution
end

puts "Congratulations! #{guess} was right!"
