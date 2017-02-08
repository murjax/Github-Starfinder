require 'net/https'
require 'json'
require 'git'
puts "Please enter your Github account name"
STDOUT.flush
account_name = gets.chomp
response = Net::HTTP.get(URI.parse("https://api.github.com/users/#{account_name}/repos"))
repositories = JSON.parse(response)

star_total = 0
repositories.each do |repo|
	puts "#{repo['name']}: #{repo['stargazers_count']} stars"
	star_total += repo['stargazers_count'].to_i
end

puts "This account has a total of #{star_total} stars."