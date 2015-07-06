module BankAccounts
  class CheckingAccount < Account
    ##--------------------------------------------------------------------------
    # CONSTANTS


    # limits
    CHECKS_LIMIT = 3
    MINIMUM_BALANCE = -10.00

    # fees
    EXCESS_CHECKS_FEE = 2.00
    WITHDRAWAL_FEE = 1.00


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS
    attr_reader :checks_used


    def initialize(id, initial_balance)
      super(id, initial_balance)

      @checks_used = 0
    end


    def reset_checks
      @checks_used = 0

      return true
    end


    # withdraw money from account.
    def withdraw(amount)
      super(amount + WITHDRAWAL_FEE)

      @balance
    end


    def withdraw_using_check(amount)
      if validate_check_withdrawal(amount)
        @checks_used += 1
      else
        return @balance
      end

      amount += EXCESS_CHECKS_FEE unless @checks_used <= 3

      withdraw(amount)

      return @balance
    end


    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS


    # check withdrawal amount is valid (not below minimum balance).
    def validate_withdrawal(amount)
      validate_number(amount)

      future_balance = @balance - amount - WITHDRAWAL_FEE

      if (future_balance < MINIMUM_BALANCE)
        warn "You cannot withdraw that much. Your minimum balance is $ #{ MINIMUM_BALANCE }, and this withdrawal would put you at $#{ future_balance }."

        return false
      end

      return true
    end


    def validate_check_withdrawal(amount)
      amount += EXCESS_CHECKS_FEE if (@checks_used + 1) > 3

      return true if validate_withdrawal(amount)

      return false
    end
  end
end
