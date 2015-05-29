# Create a SavingsAccount class with a minimum of 6 specs. The class should inherit behavior from the Account class. It should include updated logic within the following methods:
#
# self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned
# The initial balance cannot be less than $10.
# #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction.
# Does not allow the account to go below the $10 minimum balance
# Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance
# It should include the following new methods:
#
# #add_interest(rate): Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
# Input rate is assumed to be a percentage (i.e. 0.25).
# The formula for calculating interest is balance * rate/100
# Example: If the interest rate is 0.25% and the balance is $10,000, then the interest is $25 and the new balance becomes $10,025.


module BankAccounts
  class SavingsAccount < Account
    ##--------------------------------------------------------------------------
    # CONSTANTS
    WITHDRAWAL_FEE = 2.00


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS


    def initialize(id, initial_balance)
      if initial_balance < 10
        raise ArgumentError.new("You cannot create a savings account with less than a $10 initial deposit.")
      end

      super(id, initial_balance)
    end


    def add_interest(rate_percentage)
      if validate_number(rate_percentage)
        # convert rate from percentage to decimal.
        rate_decimal = rate_percentage / 100.0

        # calculate interest.
        interest = @balance * rate_decimal

        # add interest to balance.
        update_balance(interest)

        # return interest.
        return interest
      else
        return false
      end
    end


    def withdraw(amount)
      # if parent withdraw(amount) works, apply withdrawal fee to balance & return true.
      if super(amount)
        update_balance(-WITHDRAWAL_FEE)
        return true

      # otherwise, return false.
      else
        return false
      end
    end


    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS


    def validate_withdrawal(amount)
      future_balance = @balance - amount - WITHDRAWAL_FEE

      if (future_balance < 10)
        raise ArgumentError.new("You cannot withdraw that much. Your minimum balance is $10, and this withdrawal would put you at $#{ future_balance }.")
      end

      return true
    end
  end
end
