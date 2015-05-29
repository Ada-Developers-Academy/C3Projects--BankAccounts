require 'pry'

module BankAccount

  class Account
    # Makes id and initial balance viewable
    attr_reader :id, :initial_balance
    # Makes current balance changable
    attr_accessor :current_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
      @current_balance = initial_balance

      # Warning if balance is negative
      if @initial_balance < 0
        raise ArgumentError, "You can't have negative monies!"
      end

    end

    def withdraw(get_monies)

      # Proceeds if you have enough monies
      if get_monies <= @current_balance
        @current_balance -= get_monies
      else
        # Yells at you (nicely) when you don't have enough monies
        return "Sorry, you don't have that much! Withdraw canceled. Let's keep your current balance at #{@current_balance}."
      end

    end

    # Puts monies into account, updates balance
    def deposit(put_monies)
      @current_balance += put_monies
    end

    # Returns balance
    def balance
      @current_balance
    end

  end # class
end # module
