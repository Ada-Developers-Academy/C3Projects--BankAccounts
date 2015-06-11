module BankAccount
  class CheckingAccount < Account

    attr_accessor :id, :balance, :checks

    def initialize (id, initial_balance)
      @id = id
      @balance = initial_balance
      @checks = 3
    end

    def withdraw(amount)
      @balance = @balance - amount - 1
      return @balance
    end

    def withdraw_using_check(amount)
      if @balance - amount < -10
        print "This transaction cannot be completed because you will overdraft your account by more than 10."
        return @balance
      end

      if @checks <= 0
        @balance = @balance - amount - 2
        # return @balance
      else
        @balance = @balance - amount
      end
        @checks = @checks - 1
      return [ @checks, @balance ]
    end

    def reset_checks
      @checks = 3
      return @checks
    end

  end
end
