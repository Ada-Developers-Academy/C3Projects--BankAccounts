module BankAccounts
  class CheckingAccount < Account

    def initialize(id, initial_balance)
      @id = id

      if initial_balance < 0
        raise ArgumentError, "Checking account can't have a negative balance. Create a new account."
      else
        @balance = initial_balance
      end
    end


    def withdraw(amount)
      fee = 1
      if (@balance - (amount + fee)) < 0
        puts "Savings account can't have a negative balance. Transaction not processed."
        return @balance
      else
        @balance -= (amount + fee)
      end
    end

  end # class CheckingAccount
end # module BankAccounts
