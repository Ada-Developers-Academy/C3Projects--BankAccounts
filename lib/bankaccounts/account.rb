module BankAccounts

  class Account
    attr_accessor :id, :min_balance, :initial_balance, :balance, :fee

    def initialize(id, initial_balance = 0)
      @id = id
      @min_balance = 0
      @initial_balance = initial_balance
      # Raises ArgumentError if initial_balance < 0
      check_initial_balance(initial_balance)
      @balance = initial_balance
      @fee = 0
    end

    def check_initial_balance(initial_balance)
      if initial_balance == nil || initial_balance < @min_balance
        raise ArgumentError.new("Initial balance must be #{min_balance} or greater.")
      end
    end

    # Subtracts amount from balance and returns balance
    def withdraw(amount)
      # amount and fee are subtracted from balance.
      new_balance = @balance - amount - @fee

      # warn if there's a fee
      warn("Warning: This transaction will incur a $#{fee} fee.") if @fee > 0

      # does not allow the account to go negative.
      # outputs a warning message & returns the original un-modified balance
      if new_balance < @min_balance
        warn("Warning: Insufficient funds! You cannot withdraw #{amount}. Your account only has #{@balance}.")
      else
        # updates account balance
        @balance = new_balance
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
