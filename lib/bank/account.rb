module Bank
  class Account
    # attr_accessor creates an implicit balance method
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      raise ArgumentError, "Negative balance is invalid." if initial_balance.to_i < 0

      @id = id
      @balance = initial_balance.to_i
      @minimum_balance = 0
    end

    def withdraw(amount)
      # Integer() will turn strings of numbers into valid integers.
      # If it's not a whole number or includes invalid characters
      # it'll return 0 instead
      amount = Integer(amount) rescue 0
      error_message = "You cannot withdraw more than the balance minimum of $#{@minimum_balance}."
      @is_error = false

      if @balance - amount >= @minimum_balance
        @balance -= amount
      else
        @is_error = true
        puts error_message
      end

      return @balance
    end

    def deposit(amount)
      amount = Integer(amount) rescue 0
      return @balance += amount
    end
  end
end
