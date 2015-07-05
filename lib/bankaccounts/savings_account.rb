module BankAccounts

  class SavingsAccount < Account # inherits from Account class

    def initialize(id, initial_balance)
      super
      # raises an error if initial_balance is less than 10
      if initial_balance < 10
        raise ArgumentError.new("Initial balances must be at least 10")
      end
    end

    def withdraw(amount)
      # the input amount gets taken out of the account as result of an ATM transaction
      # does not allow the account to go below the $10 minimum balance
      minimum_balance = @balance - 10
      # each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance
      if (amount + 2) > minimum_balance
      # will output a warning message and return the original un-modified balance
        puts "You can't withdraw that much"
      else
        @balance -= (amount + 2)
      end
        return @balance
    end

    def add_interest(rate)
      # calculate the interest on the balance AND add the interest to the balance
      interest = @balance * rate/100
      @balance += interest
      # return the interest that was calculated and added to the balance (not the updated balance)
      return interest
      #Input rate is assumed to be a percentage (i.e. 0.25).
      #The formula for calculating interest is balance * rate/100
      #Example: If the interest rate is 0.25% and the balance is $10,000, then the interest is $25 and the new balance becomes $10,025.
    end

  end # class
end # module
