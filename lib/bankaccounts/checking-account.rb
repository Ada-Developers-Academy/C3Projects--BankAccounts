module BankAccounts

  # CheckingAccount inherits from Account class
  class CheckingAccount < Account
    def initialize(id, initial_balance)
      super
      @min_balance = 0
      check_initial_balance(initial_balance)
      @fee = 1
      @checks_used = 0
    end

    # Subtracts amount from balance, incurs $1 fee
    def withdraw(amount)
      super
    end

    def withdraw_using_check(amount)
      # re-assigns @min_balance to allow overdraft up to -$10
      @min_balance = -10
      @checks_used += 1

      # User can have three free checks in 1 month, any subsequent checks incur $2 fee
      if @checks_used <= 3
        @fee = 0
      else
        @fee = 2
      end

      # Subtracts amount
      new_balance = @balance - amount - @fee
      warn("Warning: This transaction will incur a $#{fee} fee.") if @fee > 0
      # Returns updated balance

      if new_balance < @min_balance
        warn("Warning: Insufficient funds! You cannot withdraw #{amount}. Your account only has #{@balance}.")
      else
        # updates account balance
        @balance = new_balance
      end
      return @balance

    end

    # def reset_checks
    # end


    # #reset_checks: Resets the number of checks used to zero
  end
end
