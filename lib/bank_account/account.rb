require 'pry'

module BankAccount

  class Account
    attr_reader :id, :initial_balance
    attr_accessor :current_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
      @current_balance = initial_balance

      if @initial_balance < 0
        raise ArgumentError, "You can't have negative monies!"
      end
    end

    def withdraw(get_monies)

      if get_monies <= @current_balance
        @current_balance -= get_monies
        @current_balance
      else
        return "Sorry, you don't have that much! Withdraw canceled. Let's keep your current balance at #{@current_balance}."
      end #conditional
    end # withdraw method

    def deposit(put_monies)
      @current_balance += put_monies
      @current_balance
    end

    def balance
      @current_balance
    end

  end # class
end # module
