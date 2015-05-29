module Bank
  class Account
    # attr_accessor creates an implicit balance method
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance.to_i >= 0 ? initial_balance.to_i : 0
    end

    def withdraw(amount)
      # Integer() will turn strings of numbers into valid integers.
      # If it's not a whole number or includes invalid characters
      # it'll return 0 instead
      amount = Integer(amount) rescue 0

      if @balance - amount >= 0
        @balance -= amount
      else
        @balance = 0
      end

      return @balance
    end

    def deposit(amount)
      amount = Integer(amount) rescue 0
      return @balance += amount.to_f
    end
  end
end
