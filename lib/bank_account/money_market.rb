module Bank
  # inherits from SavingsAccount which inherits from Account
  class MoneyMarketAccount < SavingsAccount
    attr_accessor :transaction_count, :day_of_month

    # inherits from Account class
    def initialize(id, initial_balance)
      super
      raise ArgumentError.new "INSUFFICIENT FUNDS" unless initial_balance >= 10000
      # additional variables specific to this class
      @transaction_count = 0
      @day_of_month = 1
    end

    # checks for low balace before allowing withdrawal
    # adds to time and transaction counts
    def withdraw(amount)
      time_passes
      low_balance
      transaction
      if @balance < amount
        puts "INSUFFICIENT FUNDS"
        return @balance
      else
        @balance -= amount
        if @balance < 10000
          @balance -= 100
          low_balance
        else
          return @balance
        end
      end
    end

    # adds amount to balance
    def deposit(amount)
      time_passes
      # allows deposit transaction for balance below lower limit
      # without adding to count
      if @balance < 10000
        return @balance += amount
      # adds to transaction if balance is above lower limit
      else
        transaction
        return @balance += amount
      end
    end

    # inherits interest method from SavingsAccount
    def add_interest(rate)
      time_passes
      super
    end

    # prevents withdrawals when balance is below lower limit
    def low_balance
      if @balance < 10000
        return "ACCOUNT FROZEN: Must make a deposit."
      end
    end

    # limits transactions to 6
    # otherwise, adds to transaction counter
    def transaction
      if @transaction_count > 6
        return "NO MORE TRANSACTIONS"
      else @transaction_count += 1
      end
    end

    # sets transaction count to zero
    def reset_transactions
      @transaction_count = 0
    end

    # adds days until the 31st, then resets transaction
    # and day of month counters
    def time_passes
      @day_of_month += 1
      if @day_of_month == 31
        reset_transactions
        return @day_of_month = 1
      end
    end

  end
end
