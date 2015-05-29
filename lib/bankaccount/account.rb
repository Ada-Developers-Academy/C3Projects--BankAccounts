module BankAccount
  class Account
    attr_reader :id, :balance, :initial_balance

    def initialize(id, initial_balance)
      # account cannot be created with initialize negative balance [breakfast]
      raise ArgumentError, "negative account balance" unless initial_balance >= 0

      @id = id
      @balance = initial_balance
      @initial_balance = initial_balance
    end

    # #withdraw(amount) [breakfast]
    def withdraw(amount, transaction_fee = 0, min_balance = 0)
      amount += transaction_fee

      if amount <= @balance - min_balance
        @balance -= amount
      else
        # may not overdraw; will output a warning and return un-modified balance [breakfast]
        puts "Insufficient funds! You have #{@balance} in your account."
        @balance
      end
    end

    # #deposit(amount): Adds the input amount to the account balance as a result of an ATM transaction [breakfast]
    def deposit(amount)
      @balance += amount
    end

  end # class end
end # module end
