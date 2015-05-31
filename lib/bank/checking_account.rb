module Bank
  class CheckingAccount < Account
    attr_accessor :check_transactions, :month

    def initialize(id, initial_balance)
      super
      @check_transactions = 0
      @month = Time.now.mon
    end

    def withdraw(amount)
      super
      # there was not an error with the withdrawal amount
      if !@is_error
        # subtract the $1 fee from balance
        return @balance - 1
      else
        # return the unmodified balance
        return @balance
      end
    end

    def withdraw_using_check(amount)
      if @month != Time.now.mon
        reset_checks
        @month = Time.now.mon
      end

      # adds $2 fee if over 3 free check limit
      amount += 2 if @check_transactions >= 3

      unless @balance - amount < -10
        @check_transactions += 1
        return @balance -= amount
      else
        puts "Account cannot overdraft over $10."
      end
    end

    def reset_checks
      @check_transactions = 0
    end
  end
end
