# Create an Account class with a minimum of 6 specs. The class should have the following methods:
#
# self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned
# Account cannot be created with initialize negative balance
# #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction.
# Does not allow the account to go negative
# #deposit(amount): Adds the input amount to the account balance as a result of an ATM transaction.
# #balance: Returns the current account balance

module BankAccounts
  class Account


    attr_reader :balance, :id


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS

    def initialize(id, initial_balance)
      if initial_balance > 0
        @balance = initial_balance.round(2)
      else
        raise ArgumentError.new("You cannot create an account with a negative balance.")
      end

      @id = id
    end


    def withdraw(amount)
      # withdrawals can only be numberic values.
      # dogs, arrays of dogs, hashes of dogs, etc not accepted here.
      unless validate_number(amount)
        return false
      end

      # raises an error if withdrawing negative or no funds.
      if (amount <= 0)
        raise ArgumentError.new("You cannot withdraw negative funds! That sounds like it should be a deposit.")
      end

      # raises an error if withdrawing funds would create a negative balance.
      if (@balance - amount) < 0
        raise ArgumentError.new("You cannot withdraw that much. Your balance would be negative.")
      end

      # adjusts balance.
      update_balance(-amount)

      return true # since transaction happened.
    end


    def deposit(amount)
      # deposits can only be numberic values.
      # cats, arrays of cats, hashes of cats, etc not accepted here.
      unless validate_number(amount)
        return false
      end

      # raises an error if depositing negative funds would create a negative balance.
      if (amount <= 0)
        raise ArgumentError.new("You cannot deposit negative funds! That sounds like it should be a withdrawal.")
      end

      # adjusts balance.
      update_balance(amount)

      return true # since transaction happened.
    end


    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS


    def update_balance(amount)
      @balance += amount.round(2)

      return true
    end


    def validate_number(input)
      unless (input.class == Fixnum) || (input.class == Float)
        raise ArgumentError.new("That is not a number!")
      end

      return true
    end
  end
end
