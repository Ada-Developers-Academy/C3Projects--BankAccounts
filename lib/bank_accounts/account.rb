module BankAccounts
  class Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id

      if initial_balance < 0
        raise ArgumentError, "Account can't have a negative balance. Create a new account."
      else
        @balance = initial_balance
      end
    end


    def deposit(amount)
      if amount < 0
        puts "Can't deposit a negative amount. Transaction not processed."
        return @balance
      else
        @balance += amount
      end
    end


    def withdraw(amount)
      if (@balance - amount) < 0
        puts "Account can't have a negative balance. Transaction not processed."
        return @balance
      else
        @balance -= amount
      end
    end


  end # class Account
end # module BankAccounts
