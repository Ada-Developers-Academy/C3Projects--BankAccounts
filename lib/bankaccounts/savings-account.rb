module BankAccounts

  # SavingsAccount inherits from Account class
  class SavingsAccount < Account

    # Initial balance < $10 raises an ArgumentError
    def check_initial_balance(initial_balance)
      if initial_balance == nil || initial_balance < 10
        raise ArgumentError.new("Initial balance must be 10 dollars or greater.")
        initial_balance = nil
      end
    end


# #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction. Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
# Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance
# It should include the following new methods:
#
# #add_interest(rate): Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
# Input rate is assumed to be a percentage (i.e. 0.25).
# The formula for calculating interest is balance * rate/100
# Example: If the interest rate is 0.25% and the balance is $10,000, then the interest is $25 and the new balance becomes $10,025.
  end

end
