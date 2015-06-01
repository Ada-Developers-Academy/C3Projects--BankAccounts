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
      @balance -= amount
      # for withdrawal greater than balance
      # gives warning error and returns original balance
      if @balance < 0
        puts "Insufficient funds. Your remaining balance is:"
        return @balance += amount
      else
        return @balance
      end
    end

  end
end
