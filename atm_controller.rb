require './validators'


class AtmController
  def initialize(atm_view)
    @atm_view = atm_view
  end


  def make_withdrawl
    @atm_view.print_withdrawl
    
    amount = @atm_view.get_amount
  
    valid = Validators.validate_postive_int(amount)
    if !valid
  
      puts "invalid amount, please enter a positive number"
      make_withdrawl  
  end  
  
  balance = @atm_view.get_balance()
  
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
  
    balance = @atm_view.get_balance()
    new_amount = (balance.to_i + amount.to_i).to_s
    File.write('balance.txt', new_amount)
    puts "Your new balance is $#{new_amount}"
  end

  def run
   # welcome loop
    @atm_view.show_options

    input = gets.chomp
    input_valid = Validators.validate_input(input)
    if !input_valid
     # print error message for invalid input
     # and re-print welcome
    puts "Invalid input, please enter a number from 1-4"
    welcome_and_input()
  end

case input.to_i

when 1
 # show balance
 @atm_view.show_balance()
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

   run()
end

end