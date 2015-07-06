module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      raise ArgumentError, "Balance must be a minimum of $10." if initial_balance < 10

      @id = id
      @balance = initial_balance.to_i
      @minimum_balance = 10
      @fee = 2
    end

    def withdraw(amount)
      super
    end

    def add_interest(rate)
      interest = @balance * rate / 100
      @balance += interest
      return interest
    end
  end
end
