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
      @balance -= amount
      return @balance
    end
binding.pry
  end # class
end # module
