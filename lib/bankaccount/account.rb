module BankAccount
  class Account
    #balance: Returns the current account balance [breakfast]
    attr_reader :id, :balance

    # self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned [breakfast]
    def initialize(id, initial_balance)
      # account cannot be created with initialize negative balance - this will raise an ArgumentError [breakfast]
      raise ArgumentError, "negative account balance" unless initial_balance >= 0

      @id = id
      @balance = initial_balance
    end

    # #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction [breakfast]
      # return value should be the updated account balance [breakfast]
    def withdraw(amount)
      if amount <= @balance
        @balance -= amount
      else
        # may not overdraw; will output a warning and return un-modified balance [breakfast]
        puts "Insufficient funds! You have #{@balance} in your account."
        @balance
      end
    end

    # #deposit(amount): Adds the input amount to the account balance as a result of an ATM transaction [breakfast]
      # return value should be the updated account balance [breakfast]
    def deposit(amount)
      @balance += amount
    end

  end # class end
end # module end
