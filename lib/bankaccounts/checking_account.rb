module BankAccounts

  class CheckingAccount < Account
      attr_accessor :check_count
      @check_count = 0  # not working

    def withdraw(amount)
      # does not allow the account to go negative.
      # will output a warning message and return the original un-modified balance
      if amount > @balance
        puts "You can't withdraw what you don't have..."
      else
      # the input amount gets taken out of the account as result of an ATM transaction.
        @balance = @balance - (amount + 1)
      # each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance.
      # returns the updated account balance.
      end
      return @balance
    end

    def withdraw_using_check(amount) # not working anymore
      # allows the account to go into overdraft up to -$10 but not any lower
      if amount > (@balance + 10)
        puts "You can't withdraw that much"
        return @balance
      else # amount is less than maximum withdrawal amount
        if @check_count  <= 3
          @balance = @balance - amount
          @check_count += 1
        else
          @balance = @balance - (amount + 2)
        end
      end
      return @balance
      # the input amount gets taken out of the account as a result of a check withdrawal
      # returns the updated account balance or the unmodified balance if amount is more than 10 more than balance
      #The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
    end

  end # class
end # module
