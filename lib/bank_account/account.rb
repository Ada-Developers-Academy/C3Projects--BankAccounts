require 'pry'

module BankAccount

  class Account
    attr_reader :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
      @current_balance = initial_balance

      if @initial_balance < 0
        raise ArgumentError, "You can't have negative monies!"
      end
    end

    def withdraw(need_monies)

      if need_monies <= @current_balance
        @current_balance -= need_monies
        @current_balance
      else
        return "Sorry, you don't have that much! Withdrawal canceled. Let's keep your current balance at #{@current_balance}."
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
