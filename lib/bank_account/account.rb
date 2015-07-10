require 'pry'

module BankAccount

  class Account
    # Makes id and initial balance viewable
    attr_reader :id, :balance

    def initialize(id, balance)
      @id = id
      @balance = balance

      # Warning if balance is negative
      if @balance < 0
        raise ArgumentError, "You can't have negative monies!"
      end

    end

    # Get monies
    def withdraw(amount)

      # Proceeds if you have enough monies
      if amount <= @balance
        @balance -= amount
      else
        # Returns your balance if you don't have enough monies
        return @balance
      end

    end

    # Puts monies into account, updates balance
    def deposit(amount)
      @balance += amount
    end

    # Returns balance
    def balance
      @balance
    end

  end # class
end # module
