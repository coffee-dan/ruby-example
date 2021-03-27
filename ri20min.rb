#!/usr/bin/env ruby

# example class with class variable and class public class methods
# attr_accessor makes variable @names publicly accessible with get/set operators
class MegaGreeter
	# names is dynamically typed, logically can be nil|string|string[]
	# programmtically it can be any type and that's not really handled?
	# but maybe it doesn't need to as the only big diff is list vs non-list
	attr_accessor :names

	# Create the object with default val "world"
	def initialize(names = "World")
		@names = names
	end

	# Say hi to everybody
	def say_hi
		# is null (nil in ruby)
		if @names.nil?
			puts "..."
		# indirect check if @names is iterable
		elsif @names.respond_to?("each")
			# @names is a list of some kind, iterate!
			# for each loop? with vertical bars for loop var
			@names.each do |name|
				puts "Hello #{name}!"
			end
		else
			puts "Hello #{@names}!"
		end
	end

	# Say bye to everybody
	def say_bye
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")
			# Join the list elements with commas
			puts "Goodbye #{@names.join(", ")}.  Come back soon!"
		else
			puts "Goodbye #{@names}.  Come back soon!"
		end
	end
end

# "main" function
if __FILE__ == $0
	mg = MegaGreeter.new
	mg.say_hi
	mg.say_bye

	# Change name to be "Zeke"
	mg.names = "Zeke"
	mg.say_hi
	mg.say_bye

	# Change the name to an array of names
	mg.names = ["Albert", "Brenda", "Charles",
				"Dave", "Engelbert"]
	mg.say_hi
	mg.say_bye

	# Change to nil
	mg.names = nil
	mg.say_hi
	mg.say_bye
end
