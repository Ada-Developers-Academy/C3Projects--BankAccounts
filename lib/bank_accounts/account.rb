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
      # guard clauses, third one just for flavor text
      validate_number(initial_balance)
      raise ArgumentError.new("An account cannot be created with a negative balance.") if (initial_balance < MINIMUM_BALANCE)
      raise ArgumentError.new(SISTER_BANK_RECOMMENDATION) if initial_balance >= RECOMMEND_SISTER_BANK

      @balance = 0
      @id = id

      update_balance(initial_balance.round(2))

      # more flavor text
      if (@balance >= RECOMMEND_MONEY_MARKET) && (@balance < RECOMMEND_SISTER_BANK) && (self.class != MoneyMarketAccount)
        puts MONEY_MARKET_RECOMMENDATION
      end
    end


    # withdraw money from account & return adjusted balance.
    def withdraw(amount)
      # guard clause to abort transaction if withdrawal would cause a negative balance.
      return @balance unless validate_withdrawal(amount)

      # guard clause: withdrawals can only be withdrawals.
      if (amount <= 0)
        warn "You cannot withdraw negative funds! That sounds like a transaction that should be a deposit."

        return @balance
      end

      # adjusts balance.
      update_balance(-amount)

      return @balance
    end


    def deposit(amount)
      # guard clause: deposits can only be numeric values.
      validate_number(amount)

      # guard clause: deposits can only be deposits.
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
      raise ArgumentError.new("That is not a number!") unless (input.class == Fixnum) || (input.class == Float)
    end


    def validate_withdrawal(amount)
      validate_number(amount)

      if (@balance - amount < 0)
        warn "You cannot withdraw that much. Your balance would be negative, and this is not a credit account."

        return false
      end

      return true
    end
  end
end
