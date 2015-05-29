module BankAccounts
  # CheckingAccount inherits from Account
  class CheckingAccount < Account
    attr_accessor :check_count

    def initialize(id, initial_balance)
      super
      @check_count = 0
    end

    # method that withdraws given amount from balance
    def withdraw(amount)
      # if given amount is not a number or less than 0, raise an error
      not_num_error unless amount.is_a? Numeric
      negative_num_error unless amount > 0

      # $1 fee is applied to each withdraw transaction
      # if the given amount + $1 transaction fee is greater than balance,
      # puts an error and return current balance
      if (amount + 1) > @balance
        puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
        return @balance
      # otherwise subtract the given amount and $1 transaction fee from balance
      else
        @balance -= (amount + 1)
      end
    end

    # method that withdraws from balance using a check
    def withdraw_using_check(amount)
      # if given amount is not a number or less than zero, raise an error
      not_num_error unless amount.is_a? Numeric
      negative_num_error unless amount > 0

      # for checking accounts, customer is allowed to decrease balance up to -$10
      # if given amount brings the balance lower than -$10, raise an error and return current balance
      if amount > (@balance - 10)
        puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
        return @balance
      end

      # if the current check count is greater than three, then apply the $2 transaction fee
      if @check_count > 3
          @balance -= (amount + 2)

      # if the current check count is less or equal to three, then just subtract just the given amount
      elsif @check_count <= 3
          @balance -= amount
      end

      # update check count
      @check_count += 1
      return @balance
    end

    # resets check count back to 0
    def reset_checks
      @check_count = 0
    end

  end
end
