module BankAccounts

  # SavingsAccount inherits from Account class
  class SavingsAccount < Account
    def initialize(id, initial_balance)
      super
      @min_balance = 10
      check_initial_balance(initial_balance)
    end

    # Initial balance < $10 raises an ArgumentError
    def check_initial_balance(initial_balance)
      if initial_balance == nil || initial_balance < @min_balance
        raise ArgumentError.new("Initial balance must be #{@min_balance} dollars or greater.")
      end
    end

    # withdraw inherits from Account class, but adds a $2 fee to each withdrawal
    def withdraw(amount)
      super(amount + 2)
    end

    # Calculates interest and adds it to the balance.
    def add_interest(rate)
      # Calculates interest
      interest = @balance * (rate/100)
      @balance += interest
      return interest
      # Returns calculated interest _not_ the updated balance
    end

# It should include the following new methods:
#
# #add_interest(rate): Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
# Input rate is assumed to be a percentage (i.e. 0.25).
# The formula for calculating interest is balance * rate/100
# Example: If the interest rate is 0.25% and the balance is $10,000, then the interest is $25 and the new balance becomes $10,025.
  end

end
