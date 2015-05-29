module BankAccounts
  class MoneyMarketAccount < Account
    ##--------------------------------------------------------------------------
    # CONSTANTS


    # limits
    MINIMUM_BALANCE = 10_000
    TRANSACTION_LIMIT = 6

    # fees
    LOW_BALANCE_FEE = 100


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS


    attr_reader :transactions


    def initialize(id, initial_balance)
      if (initial_balance >= MINIMUM_BALANCE)
        @transactions = 0

        super(id, initial_balance)

        return true

      else
        raise ArgumentError.new("You cannot create a money market account with less than a $#{ MINIMUM_BALANCE } initial deposit.")
      end
    end


    # add interest to account.
    def add_interest(rate_percentage)
      if validate_number(rate_percentage)
        # convert rate from percentage to decimal.
        rate_decimal = rate_percentage / 100.0

        # calculate interest.
        interest = @balance * rate_decimal

        # add interest to balance.
        update_balance(interest)

        # return interest.
        return interest
      else
        return false
      end
    end


    # deposit money to account.
    def deposit(amount)
      unless balance_low? # if balance is low, don't do this stuff.
        unless transaction_allowed? # if transaction is allowed, don't send a warning message!
          puts "You cannot make any additional deposits this month. You have already reached the limit (#{ TRANSACTION_LIMIT })."

          return @balance
        else # when it is allowed, increment transactions counter.
          @transactions += 1
        end
      end

      if super(amount) # call parent method to handle deposit.
        return @balance #!Q does this need to be a conditional?
      else
        return @balance
      end
    end

    def reset_transactions
      @transactions = 0

      return @balance
    end


    # withdraw money from account.
    def withdraw(amount)
      # raise an error if balance is low. otherwise, do this stuff:
      unless balance_low?
        # raise an error if transaction is not permitted. otherwise, increment transactions counter.
        if transaction_allowed?
          @transactions += 1
        else
            puts "You cannot make any additional withdrawals this month. You have already reached the limit (#{ TRANSACTION_LIMIT })."

            return @balance
        end

      else
        puts "You cannot make any additional withdrawals until your balance is above the minimum: $#{ MINIMUM_BALANCE }. Your balance is only: $ #{ @balance }."

        return @balance
      end

      if super(amount) # call parent to handle withdrawal.
        if balance_low?
          apply_low_balance_fee
        end

        return @balance
      else
        return @balance
      end
    end



    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS


    def apply_low_balance_fee
      update_balance(-LOW_BALANCE_FEE)
    end


    def balance_low?
      if @balance < MINIMUM_BALANCE
        return true
      else
        return false
      end
    end


    def transaction_allowed?
      if @transactions >= TRANSACTION_LIMIT
        return false
      else
        return true
      end
    end
  end
end
