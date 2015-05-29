require 'pry'
module BankAccount
  class SavingsAccount < Account
    MINIMUM_BALANCE = 10
    TRANSACTION_FEE = 2

    def initialize(id, initial_balance)
      super # inherits @id and @current_balance(= initial_balance) from Account class
      raise ArgumentError.new("Savings accounts\
       require a minimum balance of $10.") if initial_balance < 10
    end

    def withdraw(amount)
      if (amount + MINIMUM_BALANCE + TRANSACTION_FEE) > @current_balance
        # accounts are not allowed to go below $10
        # #withdraw will return the previous balance
        puts "WARNING: This account cannot go below $10."
        return @current_balance
      else
        return @current_balance -= (amount + TRANSACTION_FEE)
      end
    end

    def rate_as_a_percent(rate)
      rate *= 0.01 if rate > 1
      return rate # need to explicitly return rate for the case that rate is already a percentage
    end

    def add_interest(rate)
      # Make sure rate is a percentage
      percent_rate = rate_as_a_percent(rate)
      # Calculate the interest on the current balance (balance * rate/100)
      interest = @current_balance * (percent_rate/100)
      # Add interest to current balance
      @current_balance += interest
      # Return the interest (not the current balance with added interest)
      return interest
    end
  end # class
end # module
