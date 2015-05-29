module BankAccount
  class Account
    attr_reader :balance

    def initialize(id, initial_balance)
      @account_id = id
      @balance = initial_balance

      # Account cannot be created with initialize negative balance
      # this will raise an ArgumentError (Google this)
    end



    def withdraw(amount)
      new_balance = @balance - amount
       return @balance = new_balance
    end # withdraw

    def deposit(amount)
      new_balance = @balance + amount
       return @balance = new_balance
    end

  end # class


end # module
