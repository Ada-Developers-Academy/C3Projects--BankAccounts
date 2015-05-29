module BankAccounts

  class SavingsAccount < Account

    def initialize(id, initial_balance)
      super # inherits from Account class
      # raises an error if initial_balance is less than 10
      if initial_balance < 10
        raise ArgumentError.new("Initial balances must be at least 10")
      end
    end

    def withdraw(amount)
      minimum_balance = @balance - 10
      # the input amount gets taken out of the account as result of an ATM transaction
      if (amount + 2) > minimum_balance
        puts "You can't withdraw that much"
        return @balance
      else
      # each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance
      @balance = @balance - (amount + 2)
      return @balance
      end
      # does not allow the account to go below the $10 minimum balance
      # will output a warning message and return the original un-modified balance
    end




  end # class
end # module
