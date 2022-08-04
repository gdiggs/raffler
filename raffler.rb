require "bundler"
Bundler.require

TIME_BETWEEN_ROUNDS = 0.25

names = [] 

# Accept either a file name or names via STDIN
if ARGV.length > 0
  ARGV.each do |filename|
    names += File.readlines(filename, chomp: true)
  end
else
  names += STDIN.read.split("\n")
end

puts "Running Raffle for #{names.count} names"

while names.count > 1
  loser = names.shuffle!.pop
  puts "#{ColorizedString.new(loser).bold.red} has been eliminated! #{names.count} remaining"

  sleep TIME_BETWEEN_ROUNDS
end


puts "🎉🎉🎉"
puts "#{ColorizedString.new(names.first).bold.green} wins!"
puts "🎉🎉🎉"