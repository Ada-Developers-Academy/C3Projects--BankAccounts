require 'awesome_print'
module BankAccount
  class Savings < Account

    def initialize(id, initial_balance)
      super
      if @initial_balance < 10
        raise ArgumentError.new, "Initial deposit must be greater than 10"
      end
    end

    def withdraw(amount)
      super
      if amount > (@initial_balance - 10)
        raise ArgumentError.new, "Savings cannot go below 10"
      end
      return (@initial_balance -2)
    end


  end
end
