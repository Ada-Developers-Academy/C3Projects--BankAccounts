module BankAccounts

  class Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      # raises an error if initial_balance is negative
      if initial_balance < 0
        raise ArgumentError.new("Only positive initial balances allowed")
      end

      @id = id
      @balance = initial_balance
    end

    def withdraw(amount)
      # does not allow the account to go negative
      # will output a warning message and return the original un-modified balance
      if amount > @balance
        puts "You can't withdraw what you don't have..."
      else
      # the input amount gets taken out of the account as result of an ATM transaction
        @balance = @balance - amount
      end
      # return value should be the updated account balance
      return @balance
    end

    def deposit(amount)
    # adds the input amount to the account balance as a result of an ATM transaction
      @balance = @balance + amount
    # return value should be the updated account balance
      return @balance
    end

  end # class
end # module
