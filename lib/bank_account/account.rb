module Bank
  class Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      raise ArgumentError.new "Invalid initial balance" unless initial_balance > 0
      @id = id
      @balance = initial_balance
    end

    def withdraw(amount)
      @balance -= amount
      if @balance < 0
        puts "Insufficient funds. Your remaining balance is:"
        return @balance += amount
      else
        return @balance
      end
    end

  end
end
