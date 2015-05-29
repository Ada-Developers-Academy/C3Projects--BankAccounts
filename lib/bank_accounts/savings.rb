require 'pry'

module BankAccounts
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      # Require at least $10 to start savings account
      if initial_balance < 10
        raise ArgumentError.new "MINIMUM BALANCE $10 REQUIRED"
      end

      # inherit from Account parent class
      super
    end

    def withdraw(amount)

      amount += 2

      if (@balance - amount) < 10
        raise ArgumentError.new "WARNING - You must have at least $10 in your savings account.\nYour current balance is $#{@balance}."
      else
        super
        return @balance
      end

      
    end

  end # class
end # module
