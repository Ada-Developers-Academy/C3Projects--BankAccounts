require 'pry'

module BankAccounts
  class Account

    attr_reader :id, :balance

    # Rounds float down to hundredths position
    # For example 10.2599 rounds to 10.25
    def round_to_hundredths(n)
      n = (((n * 100).floor) / 100.0)
      return n
    end

    def initialize(id, initial_balance)
      @id = id
      @balance = round_to_hundredths(initial_balance)

      # Raises an error if the initial balance is negative
      if initial_balance < 0
        raise ArgumentError.new "Sorry, you can't start an account with a negative balance."
      end
    end

    def withdraw(amount)

      # Raises warning message if withdraw amount is greater than present balance
      if amount > @balance
        raise ArgumentError.new "INSUFFICIENT FUNDS\nYour current balance is $#{round_to_hundredths(@balance)}."
        return round_to_hundredths(@balance)
        
      # Return the updated balance once money is withdrawn from the account
      else
        @balance -= amount
        return round_to_hundredths(@balance)
      end
    end

    def deposit(amount)
      # Returns the updated balance once money is deposited into the account
      @balance += amount
      return round_to_hundredths(@balance)
    end

  end # class
end # module
