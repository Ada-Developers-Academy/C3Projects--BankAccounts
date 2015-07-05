module BankAccounts

  class CheckingAccount < Account
      attr_accessor :check_count

    def initialize(id, initial_balance)
      super
      @check_count = 0
    end

    def withdraw(amount)
      # does not allow the account to go negative.
      # will output a warning message and return the original un-modified balance
      if amount > @balance
        puts "You can't withdraw what you don't have..."
      else
      # the input amount gets taken out of the account as result of an ATM transaction.
        fee = 1
        @balance -= (amount + fee)
      # each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance.
      # returns the updated account balance.
      end
      return @balance
    end

    def withdraw_using_check(amount)
      # allows the account to go into overdraft up to -$10 but not any lower
      # allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
      fee = (@check_count <= 3) ? 0 : 2
      maximum_withdrawal = @balance + 10

      if amount > maximum_withdrawal
        puts "You can't withdraw that much"
      else
      # the input amount gets taken out of the account as a result of a check withdrawal
        @balance -= (amount + fee)
        @check_count += 1
      end
      # returns the updated account balance or the unmodified balance if amount is more than 10 more than balance
      return @balance
    end

    def reset_checks
      @check_count = 0
    end

  end # class
end # module
