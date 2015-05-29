module BankAccount
  class CheckingAccount < Account
  attr_accessor :check_count, :balance, :id

    def initialize(id, initial_balance)
      if initial_balance < 0
        raise ArgumentError.new("You cannot open an account with a negative balance.")
      else
      super 
      @check_count = 3
      end
    end

    def withdraw(amount)
      if (@balance - (amount + 1)) < 0
        balance
      else
      @balance -= (amount + 1)
      balance
      end
    end

    def withdraw_using_check(amount)
      if (@balance - amount) < -10
        balance
      else if check_count > 0
      @balance -= amount
      @check_count -= 1
      balance
      else
      @balance -= (2 + amount)
      balance
        end
      end
    end

    def reset_checks
      @check_count = 3
    end

  end # class end
end # module end
