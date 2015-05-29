module BankAccount
  class CheckingAccount < Account
    attr_reader :checks_used

    def initialize(id, initial_balance)
      super
      @checks_used = 0
    end

    def withdraw(amount, transaction_fee = 1, min_balance = 0) # [lunch]
      super
    end

    def withdraw_using_check(amount) # [lunch]
      withdraw(amount, check_fee, -10) # (amount, transaction_fee, min_balance)

      # increment @checks_used *after* check for sufficient funds
      @checks_used += 1
      return @balance
    end

    def reset_checks # [lunch]
      @checks_used = 0
    end

    def check_fee
      # The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee [lunch]
      if @checks_used < 3
        transaction_fee = 0
      else
        transaction_fee = 2
      end
    end
  end
end
