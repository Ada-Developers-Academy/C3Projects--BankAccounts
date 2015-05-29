require 'pry'

module BankAccount

  class SavingsAccount
    attr_reader :id, :initial_balance
    attr_accessor :current_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
      @current_balance = initial_balance

      if @initial_balance < 10
        raise ArgumentError, "You can't have negative monies!"
      end
    end

    def withdraw(get_monies)
      highway_robbery = get_monies + 2
      @current_balance -= highway_robbery
    end

  end

end
