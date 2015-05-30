module BankAccounts
  class Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id

      # must have at least $0 balance
      if initial_balance < 0
        raise ArgumentError, "Account can't have a negative balance. Create a new account."
      else
        @balance = initial_balance
      end
    end


    def deposit(amount)
      amount = amount.abs # real ATMs don't have a 'negative number' button
      @balance += amount
    end


    def withdraw(amount)
      amount = amount.abs # real ATMs don't have a 'negative number' button
      if (@balance - amount) < 0
        puts "Account can't have a negative balance. Transaction not processed."
        return @balance
      else
        @balance -= amount
      end
    end


  end # class Account
end # module BankAccounts
