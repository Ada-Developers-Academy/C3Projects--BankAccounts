module BankAccount
  class Account
    #balance: Returns the current account balance [breakfast]
    attr_reader :id, :balance

    # self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned [breakfast]
    def initialize(id, initial_balance)
      # Account cannot be created with initialize negative balance - this will raise an ArgumentError [breakfast]
      raise ArgumentError, "negative account balance" unless initial_balance >= 0

      @id = id
      @balance = initial_balance
    end

    # # #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction
    #   # return value should be the updated account balance
    #   # does not allow the account to go negative - Will output a warning message and return the original un-modified balance
    # def withdraw(amount)
    # end

    # # #deposit(amount): Adds the input amount to the account balance as a result of an ATM transaction
    #   # return value should be the updated account balance
    # def deposit(amount)
    # end

  end # class end
end # module end
