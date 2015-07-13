module BankAccount
  class CheckingAccount < Account
  attr_accessor :check_count, :balance, :id

    def initialize(id, initial_balance)
      super
      @check_count = 3
    end

    def withdraw(amount)
      amount = amount.rounded
      if (@balance - (amount + 1)) < 0
        get_balance
      else
        @balance -= (amount + 1)
        get_balance
      end
    end

    def withdraw_using_check(amount)
      amount = amount.rounded
      if (@balance - amount) < -10
        get_balance
      elsif check_count > 0
        @balance -= amount
        @check_count -= 1
        get_balance
      else
        @balance -= (2 + amount)
        get_balance
      end
    end

    def reset_checks
      @check_count = 3
    end

  end # class end
end # module end
