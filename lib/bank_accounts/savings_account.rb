module BankAccounts

  class SavingsAccount < Account

    # ADDS INTEREST TO BALANCE & RETURNS INTEREST AMOUNT
    def add_interest(rate)
      interest = @balance * (rate/100)
      @balance += interest
      return interest
    end

    private

    def bank_info
      @min_balance = 10
      @atm_withdraw_fee = 2
    end

  end

end
