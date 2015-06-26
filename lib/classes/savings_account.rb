require 'awesome_print'
module BankAccount
  class Savings < Account

    def initialize(id, initial_balance)
      super
      if @current_balance < 10
        raise ArgumentError.new, "Initial deposit must be greater than 10"
      end
    end

    def withdraw(amount)
      super
      if amount > (@current_balance - 10)
        raise ArgumentError.new, "Savings cannot go below 10"
      end
      return (@current_balance -= 2)
    end

    def add_interest(rate)
      @rate = Float(rate)
      @interest = @current_balance * (@rate/100)
      @current_balance += @interest
      return @interest
    end

  end
end
