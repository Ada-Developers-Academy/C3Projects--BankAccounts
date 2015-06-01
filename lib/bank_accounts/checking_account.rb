module BankAccounts

  class CheckingAccount < Account

    attr_reader :checks_used

    # SUBTRACT AMOUNT (+ FEE) FROM BALANCE, RETURN BALANCE, & INCREASE CHECKS USED
    def withdraw_using_check(amount)
      neg_num_guard(amount)
      @checks_used += 1

      if @checks_used > 3
        amount += @check_withdraw_fee
      end

      if (@balance - amount) < @max_overdraft
        puts "Cannot withdraw amount; not enough money in account."
        return @balance
      end

      @balance -= amount
    end

    # RESETS CHECKS USED TO ZERO
    def reset_checks
      @checks_used = 0
    end

    private

    def bank_info
      @min_balance = 0
      @max_overdraft = -10
      @atm_withdraw_fee = 1
      @check_withdraw_fee = 2
      @checks_used = 0
    end

  end

end
