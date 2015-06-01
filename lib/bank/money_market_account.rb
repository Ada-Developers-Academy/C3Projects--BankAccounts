module Bank
  class MoneyMarketAccount < Account
    attr_accessor :num_of_transactions

    def initialize(id, initial_balance)
      super
      @num_of_transactions = 0
    end

    def is_at_transaction_limit
      if @num_of_transactions >= 6
        # uses abort because I want to end the transaction request
        abort("You've reached your transaction limit for this month.")
      end
    end

    def withdraw(amount)
      is_at_transaction_limit

      super

      # if the transaction was successful
      if !@is_withdrawal_error
        @num_of_transactions += 1
      end
    end

    def deposit(amount)
      is_at_transaction_limit

      super
      @is_deposit_error = true if amount == 0

      if !@is_deposit_error
        @num_of_transactions += 1
      end
    end
  end
end
