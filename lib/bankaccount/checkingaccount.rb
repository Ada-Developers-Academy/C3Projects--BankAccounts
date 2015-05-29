module BankAccount
  class CheckingAccount < Account
    attr_reader :checks_used

    def withdraw(amount, transaction_fee = 1, min_balance = 0) # [lunch]
      super
      @checks_used = 0
    end

    def withdraw_using_check(amount) # [lunch]
    #   # The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
    #   if @checks_used < 3
    #     transaction_fee = 0
    #   else
    #     transaction_fee = 2
        # end

    #   self.withdraw(amount, transaction_fee, -10) # (amount, transaction_fee, min_balance)

    #   # increment @checks_used _after_ check for sufficient funds
    #   @checks_used += 1
    #   return @balance
    end

    # # #reset_checks: Resets the number of checks used to zero
    # def reset_checks
      # @checks_used = 0
    # end
  end
end
