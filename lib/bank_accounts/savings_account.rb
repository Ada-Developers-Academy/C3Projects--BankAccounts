module BankAccounts
  class SavingsAccount < Account
    ##--------------------------------------------------------------------------
    # CONSTANTS

    # limits
    MINIMUM_BALANCE = 10

    # fees
    WITHDRAWAL_FEE = 2.00


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS


    # create a new savings account.
    def initialize(id, initial_balance)
      if initial_balance < MINIMUM_BALANCE
        raise ArgumentError.new("You cannot create a savings account with less than a $#{ MINIMUM_BALANCE } initial deposit.")
      end

      super(id, initial_balance)

      return true
    end


    # add interest to account.
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


    # withdraw money from account.
    def withdraw(amount)
      if super(amount + WITHDRAWAL_FEE)
        return @balance
      else
        return @balance
      end
    end


    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS


    # check withdrawal amount is valid (not below minimum balance).
    def validate_withdrawal(amount)
      unless validate_number(amount)
        return false
      end

      future_balance = @balance - amount - WITHDRAWAL_FEE

      if (future_balance < MINIMUM_BALANCE)
        warn "You cannot withdraw that much. Your minimum balance is $#{ MINIMUM_BALANCE }, and this withdrawal would put you at $#{ future_balance }."

        return false
      end

      return true
    end
  end
end
