module BankAccounts
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      @id = id

      # must have at least $10 balance
      if initial_balance < 10
        raise ArgumentError, "Savings account balance must be at least $10. Create a new savings account."
      else
        @balance = initial_balance
      end
    end


    def withdraw(amount)
      amount = amount.abs # real ATMs don't have a 'negative number' button
      fee = 2
      if (@balance - (amount + fee)) < 10
        puts "Savings account balance must be at least $10. Transaction not processed."
        return @balance
      else
        puts "Transaction fee: $2"
        @balance -= (amount + fee)
      end
    end


    def add_interest(rate)
      rate = rate.abs # real ATMs don't have a 'negative number' button
      interest = ((@balance * rate) / 100).to_i
      if (@balance + interest) < 10
        puts "Savings account balance must be at least $10. Transaction not processed."
        return @balance
      else
        @balance += interest
        return interest
      end
    end


  end # class SavingsAccount
end # module BankAccounts
