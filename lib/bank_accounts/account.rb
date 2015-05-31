# throw error it's more of a prog thing like a data type that won't be recognized by a method.
# if it's more the user trying to take too much, return false b/c the method call is where the error message should trigger.

# be consistent about throwing errors vs false.

# PRIVATE might be the cause / PROTECTED might be the solution
# nope not returning true/false
# !R private vs protected


module BankAccounts
  class Account
    ##--------------------------------------------------------------------------
    # CONSTANTS


    # limits
    MINIMUM_BALANCE = 0


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS


    attr_reader :balance, :id


    def initialize(id, initial_balance)
      if initial_balance >= MINIMUM_BALANCE
        @balance = 0
        update_balance(initial_balance.round(2))
      else
        raise ArgumentError.new("An account cannot be created with a negative balance.")
      end

      if (@balance >= RECOMMEND_MONEY_MARKET) && (@balance < RECOMMEND_SISTER_BANK) && (self.class != MoneyMarketAccount)
        puts MONEY_MARKET_RECOMMENDATION
      end

      if (@balance >= RECOMMEND_SISTER_BANK)
        raise ArgumentError.new(SISTER_BANK_RECOMMENDATION)
      end

      @id = id

      return true
    end


    # withdraw money from account & return adjusted balance.
    def withdraw(amount)
      # withdrawals must not create negative balances.
      unless validate_withdrawal(amount)
        return @balance
      end

      # sends a message to the user if attempting to withdraw negative or zero funds.
      if (amount <= 0)
        warn "You cannot withdraw negative funds! That sounds like a transaction that should be a deposit."

        return @balance
      end

      # adjusts balance.
      update_balance(-amount)

      return @balance
    end


    def deposit(amount)
      # deposits can only be numeric values.
      unless validate_number(amount)
        return @balance
      end

      # raises an error if depositing negative funds would create a negative balance.
      if (amount <= 0)
        warn "You cannot deposit negative funds! That sounds like a transaction that should be a withdrawal."

        return @balance
      end

      # adjusts balance.
      update_balance(amount)

      return @balance
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


    def validate_withdrawal(amount)
      unless validate_number(amount)
        return false
      end

      if (@balance - amount < 0)
        warn "You cannot withdraw that much. Your balance would be negative, and this is not a credit account."
        return false
      end

      return true
    end
  end
end
