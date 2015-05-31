module BankAccounts
  class CheckingAccount < Account
    ##--------------------------------------------------------------------------
    # CONSTANTS


    # limits
    CHECKS_LIMIT = 3
    MINIMUM_BALANCE = -10

    # fees
    EXCESS_CHECKS_FEE = 2.00
    WITHDRAWAL_FEE = 1.00


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS
    attr_reader :checks_used


    def initialize(id, initial_balance)
      super(id, initial_balance)

      @checks_used = 0

      return true
    end


    def reset_checks
      @checks_used = 0

      return true
    end


    # withdraw money from account.
    def withdraw(amount)
      if super(amount + WITHDRAWAL_FEE)
        return @balance
      else
        return @balance
      end
    end


    def withdraw_using_check(amount)
      if validate_check_withdrawal(amount)
        @checks_used += 1
      end

      unless @checks_used <= 3
        amount += EXCESS_CHECKS_FEE
      end

      if withdraw(amount)
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
        warn "You cannot withdraw that much. Your minimum balance is $ #{ MINIMUM_BALANCE }, and this withdrawal would put you at $#{ future_balance }."

        return false
      end

      return true
    end


    def validate_check_withdrawal(amount)
      if (@checks_used + 1) > 3
        amount += EXCESS_CHECKS_FEE
      end

      if validate_withdrawal(amount)
        return true
      end

      return false
    end
  end
end
