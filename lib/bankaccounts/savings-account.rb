module BankAccounts

  # SavingsAccount inherits from Account class
  class SavingsAccount < Account
    def initialize(id, initial_balance)
      super
      @min_balance = 10
      check_initial_balance(initial_balance)
      @fee = 2
    end

    # withdraw is inherited from Account; therefore, it does not appear here.
    # withdraw(amount) subtracts amount from balance, incurs $2 fee.
    # if account would fall below @min_balance, outputs warning & returns unmodified balance.

    # Calculates interest and adds it to the balance.
    def add_interest(rate)
      # Calculates interest & updates balance
      interest = @balance * (rate/100)
      @balance += interest
      # Returns calculated interest _not_ the updated balance
      return interest
    end

  end

end
