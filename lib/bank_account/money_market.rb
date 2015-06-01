module Bank
  class MoneyMarketAccount < SavingsAccount
    attr_accessor :transaction_count

    def initialize(id, initial_balance)
      super
      raise ArgumentError.new "Insufficient Funds" unless initial_balance >= 10000
      @transaction_count = 0
    end

    def transaction
      @transaction_count += 1
    end

    def withdraw(amount)
      low_balance
      transaction
      @balance -= amount
      if @balance < 10000
        @balance -= 100
      else
        return @balance
      end
    end

    def add_interest(rate)
      super
    end

    def low_balance
      if @balance < 10000
        return "LOW BALANCE: Must make a deposit."
      end
    end

  end
end
