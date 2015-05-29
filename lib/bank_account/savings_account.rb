module BankAccount

require './lib/bank_account/account'

  class SavingsAccount < Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance

      unless @balance >= 10
        raise ArgumentError.new("You can't start out with a balance below $10. Add moar monies.")
      end
      # need to return balance?
    end

    # def withdraw(amount)
    #   super
    #
    # end

    def deposit(amount)
      super
    end

    # def add_interest(rate)
    # end

  end
  ## Account.new ??
end
