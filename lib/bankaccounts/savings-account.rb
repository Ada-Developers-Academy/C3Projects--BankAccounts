module BankAccounts

  # SavingsAccount inherits from Account class
  class SavingsAccount < Account
    def initialize(id, initial_balance)
      super
      @min_balance = 10
      check_initial_balance(initial_balance)
      @fee = 2
    end

    # Initial balance < $10 raises an ArgumentError
    def check_initial_balance(initial_balance)
      if initial_balance == nil || initial_balance < @min_balance
        raise ArgumentError.new("Initial balance must be #{@min_balance} dollars or greater.")
      end
    end

    # Subtracts amount from balance, incurs $2 fee
    def withdraw(amount)
      super(amount)
    end

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
