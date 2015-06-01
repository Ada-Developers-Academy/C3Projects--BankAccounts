module Bank
  class MoneyMarketAccount < SavingsAccount
    attr_accessor :transaction_count, :day_of_month

    def initialize(id, initial_balance)
      super
      raise ArgumentError.new "INSUFFICIENT FUNDS" unless initial_balance >= 10000
      @transaction_count = 0
      @day_of_month = 1
    end

    def transaction
      @transaction_count += 1
    end

    def reset_transactions
      @transaction_count = 0
    end

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

    def deposit(amount)
      time_passes
      if @balance < 10000
        return @balance += amount
      else
        transaction
        return @balance += amount
      end
    end

    def add_interest(rate)
      time_passes
      super
    end

    def low_balance
      if @balance < 10000
        return "ACCOUNT FROZEN: Must make a deposit."
      end
    end

    def transaction
      if @transaction_count > 6
        return "NO MORE TRANSACTIONS"
      else @transaction_count += 1
      end
    end

    def time_passes
      @day_of_month += 1
      if @day_of_month == 31
        reset_transactions
      end
    end

  end
end
