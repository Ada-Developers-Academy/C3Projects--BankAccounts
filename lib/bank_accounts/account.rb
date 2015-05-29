module BankAccounts
  class Account

    attr_reader :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance

      # Raises an error if the initial balance is negative
      if initial_balance < 0
        raise ArgumentError.new "Sorry, you can't have a negative balance"
      end
    end

    def withdraw(amount)

      # Raises warning message if withdraw amount is greater than present balance
      if amount > @balance
        raise ArgumentError.new "WARNING you have overdrawn your account. Your current balance is #{@balance}."
      
      # Return the updated balance once money is withdrawn from the account
      else
        @balance -= amount
        return @balance
      end
    end

   # #self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned
    # #Account cannot be created with initialize negative balance - this will raise an ArgumentError (Google this)

   # withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction. Return value should be the updated account balance.
    # Does not allow the account to go negative - Will output a warning message and return the original un-modified balance

   # deposit(amount): Adds the input amount to the account balance as a result of an ATM transaction. Return value should be the updated account balance

   # balance: Returns the current account balance

  end # class
end # module
