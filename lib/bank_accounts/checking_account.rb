module BankAccounts

  class CheckingAccount < Account

    WITHDRAW_FEE = 1
    MAX_OVERDRAFT = -10

    def withdraw_using_check(amount)
      neg_num_guard(amount)

      if (@balance - amount) < MIN_BALANCE
        puts "Cannot withdraw amount; not enough money in account."
        return @balance
      end

      @balance -= amount
    end

    # CHECKS TO MAKE SURE NUMBER ISN'T NEGATIVE; THROWS ERROR IF SO
    def overdraft_num_guard(num)
      raise ArgumentError, "not enough money" if num < MIN_BALANCE
    end

  end

end
