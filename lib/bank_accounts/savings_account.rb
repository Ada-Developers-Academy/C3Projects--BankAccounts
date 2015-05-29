module BankAccounts
  class SavingsAccount < Account
    attr_reader :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id

      if initial_balance < 10
        raise ArgumentError, "Savings account balance must be at least $10. Create a new savings account."
      else
        @balance = initial_balance
      end
    end


    def withdraw(amount)
      fee = 2
      if (@balance - (amount + fee)) < 10
        puts "Savings account balance must be at least $10. Withdraw not processed."
        return @balance
      else
        @balance -= (amount + fee)
      end
    end


    def add_interest(rate)
      
    end


  end # class SavingsAccount
end # module BankAccounts
