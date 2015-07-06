module Bank
  class Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      # raises error for negative initial balance
      raise ArgumentError.new "Invalid initial balance" unless initial_balance > 0
      @id = id
      @balance = initial_balance
    end

    # subtracts amount from total balance
    def withdraw(amount)
      if amount > @balance
        puts "Insufficient funds. Your remaining balance is:"
      else
        @balance -= amount
      end
      return @balance
    end

    def deposit(amount)
      @balance += amount
      return @balance
    end

  end
end
