module BankAccounts

  class SavingsAccount < Account

    MIN_BALANCE = 10
    WITHDRAW_FEE = 2

    def initialize(id, initial_balance)
      super   # to demonstrate super
      puts "Savings Account created."
    end

    # Learned something new:
    # constants defined in a higher class
    # do not get overriden by the
    # child's constant.

    # ADDS INTEREST TO BALANCE & RETURNS INTEREST AMOUNT
    def add_interest(rate)
      interest = @balance * (rate/100)
      @balance += interest
      return interest
    end

  end

end
