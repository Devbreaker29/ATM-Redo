def hello
    return "hello world"
end

def welcome_and_input
end

system("clear")
puts "Welcome to your friendly neighbourhood ATM!"
puts "Please select from the following options:"
puts "1. Display Balance"
puts "2. Make a Withdrawl"
puts "3. Make a deposit"
puts "4. Exit"
input = gets.chomp.to_i

case input

when 1
 # show balance
when 2
  # make a withdrawl
when 3
  # make a deposit
when 4
  # exit the program
  puts "goodbye"
  system("exit")
else
  # print error message for invalid input
  # and re-print welcome
  puts "Invalid input, please enter a number from 1-4"
  puts "Press any key to continue"
  gets 
  welcome_and_input()
end

welcome_and_input()