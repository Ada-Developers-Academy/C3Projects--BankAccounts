# THINGS TO RESEARCH FOR LATER
# * raise
# * ArgumentError
# * rspec method raise_exception

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
      @balance += amount
    end

    def withdraw(amount)
      if (@balance - amount) < 0
        puts "Account can't have a negative balance. Withdraw not processed."
        return @balance
      else
        @balance -= amount
      end
    end



  end # class Account
end # module BankAccounts
