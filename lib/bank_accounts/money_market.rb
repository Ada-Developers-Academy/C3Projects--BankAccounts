require 'pry'

module BankAccounts
  class MoneyMarketAccount < Account

    attr_reader :transactions

    def initialize(id, initial_balance)
      # start counting total transactions
      @transactions = 0

      # Require at least $10000 to start savings account
      if round_to_hundredths(initial_balance) < 10000
        raise ArgumentError.new "MINIMUM BALANCE $10000 REQUIRED"
      end

      # inherit from Account class
      super
    end

    def withdraw(amount)
      # each withdrawal counts as a transaction
      @transactions += 1

      if (@balance - amount) < 10000
        amount += 100
        @balance -= amount
      else
        super
      end
      return @balance = round_to_hundredths(@balance) 
      super
    end

  end # class
end # module
