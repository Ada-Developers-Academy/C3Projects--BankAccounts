module BankAccounts
  class CheckingAccount < Account
    attr_reader :checks_used

    def initialize(id, initial_balance)
      @id = id
      @checks_used = 0

      # must have at least $0 balance
      if initial_balance < 0
        raise ArgumentError, "Checking account can't have a negative balance. Create a new account."
      else
        @balance = initial_balance
      end
    end


    def withdraw(amount)
      amount = amount.abs # real ATMs don't have a 'negative number' button
      fee = 1
      if (@balance - (amount + fee)) < 0
        puts "Checking account can't have a negative balance. Transaction not processed."
        return @balance
      else
        puts "Transaction fee: $1"
        @balance -= (amount + fee)
      end
    end


    def withdraw_using_check(amount)
      amount = amount.abs # real banks don't accept 'negative number' checks
      @checks_used += 1
      fee = 2

      if @checks_used <= 3 # 3 free checks per month
        # can have up to -$10 balance when using checks
        if (@balance - amount) < -10
          puts "Checking account can only go into overdraft up to -$10. Transaction not processed."
          return @balance
        else
          @balance -= amount
        end
      else # after 3 checks, adds transaction fee
        if (@balance - (amount + fee)) < -10
          puts "Checking account can only go into overdraft up to -$10. Transaction not processed."
          return @balance
        else
          puts "Transaction fee: $2"
          @balance -= (amount + fee)
        end
      end

    end


    # end of month
    def reset_checks
      @checks_used = 0
    end


  end # class CheckingAccount
end # module BankAccounts
