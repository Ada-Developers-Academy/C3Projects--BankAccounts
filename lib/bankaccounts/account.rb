module BankAccounts

  class Account
    attr_accessor :id, :initial_balance, :balance

    def initialize(id, initial_balance = 0)
      @id = id
      @initial_balance = initial_balance
      # Raise ArgumentError if initial_balance < 0
      check_initial_balance(initial_balance)
      @balance = initial_balance
    end

    def check_initial_balance(initial_balance)
      if initial_balance == nil || initial_balance < 0
        raise ArgumentError.new("Initial balance must be 0 or greater.")
        @initial_balance = 0
      end
    end

    # Subtracts amount from balance and returns balance
    def withdraw(amount)
      # amount is subtracted from balance.
      new_balance = @balance - amount
      min_balance = 0
      # Does not allow the account to go negative - Will output a warning message and return the original un-modified balance
      if (new_balance) < min_balance
        # raise StandardError.new("Warning: You cannot withdraw #{amount}. Your account only has #{@balance}.")
        warn("Warning: Insufficient funds! You cannot withdraw #{amount}. Your account only has #{@balance}.")
      else
        @balance = new_balance
        # returns the updated account balance.
      end
      return @balance
    end

    # Adds amount to balance and returns balance
    def deposit(amount)
      @balance += amount
      return @balance
    end

    # returns balance
    def balance
      @balance
    end
  end

end
