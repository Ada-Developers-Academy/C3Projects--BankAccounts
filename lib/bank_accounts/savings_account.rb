module BankAccount

#_________________________________________________________________________
# SavingsAccount inherits behavior from the Account class

  class SavingsAccount < Account

#__________________________________________________________________________
# Constant: fee $2
      FEE = 2
#__________________________________________________________________________
# Initialize method

    def initialize(id, initial_balance)
      super(id, initial_balance)

      # if balance is less than $10 it will raise ArgumentError
      if @balance < 10
        raise ArgumentError
      end
    end
#_________________________________________________________________________
# Withdraw method

    def withdraw(amount)

      # if balance would go below $10 it will output a warning message
      if @balance - (amount + FEE) < 10
        puts "Balance below $10 is not allowed"
      else
      # each withdrawal transaction incurs a fee of $2
        @balance -= amount + FEE
      end

      # returns last updated balance
      return @balance
    end
#__________________________________________________________________________
# Add_interest method

    def add_interest(rate)
      # calculation of interest in $
       interest = @balance *rate/100

      # interest added to the current balance
       @balance += interest

      # returns interest in $
      return interest
    end
  end
end
