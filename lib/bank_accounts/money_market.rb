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

      super
    end
binding.pry
  end # class
end # module
