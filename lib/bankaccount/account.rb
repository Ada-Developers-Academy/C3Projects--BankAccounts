module BankAccount
  class Account
    attr_reader :id, :balance, :initial_balance

    def initialize(id, initial_balance, required_opening_balance = 0)
      # account cannot be created with negative balance [breakfast]
      raise ArgumentError, "insufficient opening balance" unless initial_balance >= required_opening_balance

      @id = id
      @balance = initial_balance
      @initial_balance = initial_balance
    end

    def withdraw(amount, transaction_fee = 0, min_balance = 0) # [breakfast]
      amount += transaction_fee

      if amount <= @balance - min_balance
        @balance -= amount
      else
        # may not overdraw; will output a warning and return un-modified balance [breakfast]
        puts "Insufficient funds! You have $#{@balance} in your account."
        @balance
      end
    end

    def deposit(amount) # [breakfast]
      @balance += amount
    end

  end # class end
end # module end
