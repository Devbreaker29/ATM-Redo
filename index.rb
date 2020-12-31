require_relative 'validators'
require_relative 'atm_view'

# system("clear")

# puts "ARGV:"
# p ARGV

def welcome_and_input(atm_view)
    atm_view.show_options

input = gets.chomp
input_valid = Validators.validate_input(input)
if !input_valid
     # print error message for invalid input
     # and re-print welcome
    puts "Invalid input, please enter a number from 1-4"
    puts "Press any key to continue"
    gets 
    welcome_and_input()
  end

case input.to_i

when 1
 # show balance
 show_balance()
when 2
  # make a withdrawl
  make_withdrawl()
when 3
  # make a deposit
  make_deposit()
when 4
  # exit the program
  puts "goodbye"
  exit(0)
end
   welcome_and_input(atm_view)
end

def show_balance
    # show balance
    balance = get_balance()
    puts "balance: $#{balance}"
end

def get_balance
    File.read('balance.txt')
end

def make_withdrawl
  puts "How much do you want to withdraw?"
  amount = gets.chomp

  valid = Validators.validate_postive_int(amount)
  if !valid

    puts "invalid amount, please enter a positive number"
    make_withdrawl  
end  

balance = get_balance()

valid = Validators.validate_amount_against_balance(amount, balance)
if !valid
  puts "Your withdrawl is greater than your balance"
  make_withdrawl()
end

updated_amount = (balance.to_i - amount.to_i).to_s
  File.write('balance.txt', updated_amount)
  # print the withdrawl amount
  puts "Your new balance is $#{updated_amount}"
end

def make_deposit
  puts "How much to deposit?"
  
  amount = gets.chomp
  valid = Validators.validate_postive_int(amount)

  if !valid
    puts "invalid amount, please enter a positive number"
    make_deposit()
  end

  balance = get_balance()
  new_amount = (balance.to_i + amount.to_i).to_s
  File.write('balance.txt', new_amount)
  puts "Your new balance is $#{new_amount}"
end

if ARGV.length > 0
 
  if ARGV[0] == '-h'|| ARGV[0] == '--help'
    # print the help menu
  puts "you asked for help"
  end
else

 atm_view = AtmView.new
 welcome_and_input(atm_view)
end

