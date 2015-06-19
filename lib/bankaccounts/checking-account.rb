module BankAccounts

  # CheckingAccount inherits from Account class
  class CheckingAccount < Account
    attr_reader :checks_used

    def initialize(id, initial_balance)
      super
      @min_balance = 0
      @fee = 1
      @checks_used = 0
    end

    # withdraw is inherited from Account; therefore, it does not appear here.
    # withdraw(amount) subtracts amount from balance, incurs $1 fee.
    # if account would fall below @min_balance, outputs warning & returns unmodified balance.

    def withdraw_using_check(amount)
      # re-assigns @min_balance to allow overdraft up to -$10
      min_balance = -10
      # increments @checks_used
      @checks_used += 1

      # User can have three free checks in 1 month, any subsequent checks incur $2 fee
      @checks_used <= 3 ? fee = 0 : fee = 2

      # Subtracts amount
      new_balance = @balance - amount - fee
      warn("Warning: This transaction will incur a $#{fee} fee.") if fee > 0

      # if account would fall below @min_balance, outputs warning & returns unmodified balance.
      if new_balance < min_balance
        warn("Warning: Insufficient funds! You cannot withdraw #{amount}. Your account only has #{@balance}.")
      else
        # updates account balance
        @balance = new_balance
      end
      return @balance
    end

    # Resets the number of checks used to zero
    def reset_checks
      @checks_used = 0
    end

  end
end
