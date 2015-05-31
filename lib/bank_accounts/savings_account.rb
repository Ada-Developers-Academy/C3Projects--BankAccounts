module BankAccounts

  class SavingsAccount < Account

    MIN_BALANCE = 10
    WITHDRAW_FEE = 2

    # SUBTRACT AMOUNT + FEE FROM BALANCE & RETURN BALANCE
    def withdraw(amount)
      amount += WITHDRAW_FEE
      super
    end

    # ADDS INTEREST TO BALANCE & RETURNS INTEREST AMOUNT
    def add_interest(rate)
      interest = @balance * (rate/100)
      @balance += interest
      return interest
    end

    private

    # CHECKS TO MAKE SURE NUMBER ISN'T BELOW 10; THROWS ERROR IF SO
    def neg_num_guard(num)
      raise ArgumentError, "must have $10 in savings account" if num < MIN_BALANCE
    end

  end

end
