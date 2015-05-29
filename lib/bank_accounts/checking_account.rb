require 'pry'
module BankAccounts
  class CheckingAccount < Account
    attr_accessor :check_count

    def initialize(id, initial_balance)
      super
      @check_count = 0
    end

    def withdraw(amount)
      not_num_error unless amount.is_a? Numeric
      negative_num_error unless amount > 0

      if (amount + 1) > @balance
        puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
        return @balance
      else
        @balance -= (amount + 1)
      end
    end


    def withdraw_using_check(amount)
      not_num_error unless amount.is_a? Numeric
      negative_num_error unless amount > 0

      if amount > (@balance - 10)
        puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
        return @balance
      end

      if @check_count > 3
          @balance -= (amount + 2)
          @check_count += 1
      elsif @check_count <= 3
          @balance -= amount
          @check_count += 1
      end

      return @balance
    end


    def reset_checks
      @check_count = 0
    end

  end
end
