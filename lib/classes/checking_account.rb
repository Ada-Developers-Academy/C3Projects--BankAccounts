module BankAccount
  class Checking < Account

    def withdraw(amount)
      super
      return (@current_balance -= 1)
    end

    def withdraw_using_check(amount)
      if amount > (@current_balance + 10)
        raise ArgumentError.new, "You cannot overdraw more than -$10 of your account balance."
      end
      @check_use ||= 1
       if @check_use <= 3
        @current_balance -= amount
      else @check_use > 3
        @current_balance -= (amount + 2)
      end
      #puts @check_use
      @check_use += 1
      return @current_balance
    end

  end

end
