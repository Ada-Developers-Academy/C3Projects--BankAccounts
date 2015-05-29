module BankAccounts

  class SavingsAccount < Account

    MIN_BALANCE = 10

    # CHECKS TO MAKE SURE NUMBER ISN'T BELOW 10; THROWS ERROR IF SO
    def neg_num_guard(num)
      raise ArgumentError, "must have $10 in savings account" if num < MIN_BALANCE
    end

  end

end
