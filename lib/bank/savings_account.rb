module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      raise ArgumentError, "Balance must be a minimum of $10." if initial_balance < 10

      @id = id
      @balance = initial_balance.to_i
      @minimum_balance = 12
    end

    def withdraw(amount)
      super
      # there was not an error with the withdrawal amount
      if !@is_error
        # subtract the $2 fee from balance
        return @balance - 2
      else
        # return the unmodified balance
        return @balance
      end
    end

    def add_interest(rate)
      interest = @balance * rate / 100
      @balance += interest
      return interest
    end
  end
end
