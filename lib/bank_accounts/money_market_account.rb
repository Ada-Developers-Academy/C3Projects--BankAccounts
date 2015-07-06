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
      raise ArgumentError.new("You cannot create a money market account with less than a $#{ MINIMUM_BALANCE } initial deposit.") unless (initial_balance >= MINIMUM_BALANCE)

      @transactions = 0

      super(id, initial_balance)
    end


    # add interest to account
    def add_interest(rate_percentage)
      validate_number(rate_percentage)

      # convert rate from percentage to decimal
      rate_decimal = rate_percentage / 100.0

      # calculate interest
      interest = @balance * rate_decimal

      # add interest to balance
      update_balance(interest)

      return interest
    end


    # deposit money to account.
    def deposit(amount)
      unless balance_low? # if balance is low, don't do this stuff.
        if transaction_allowed? # if transaction is allowed, don't send a warning message!
          @transactions += 1 # and increment transactions counter.

        else
          warn "You cannot make any additional deposits this month. You have already reached the limit (#{ TRANSACTION_LIMIT })."

          return @balance
        end
      end

      super(amount) # call parent method to handle deposit.

      return @balance
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
            warn "You cannot make any additional withdrawals this month. You have already reached the limit (#{ TRANSACTION_LIMIT })."

            return @balance
        end

      else
        warn "You cannot make any additional withdrawals until your balance is above the minimum: $#{ MINIMUM_BALANCE }. Your balance is only: $ #{ @balance }."

        return @balance
      end

      super(amount) # call parent to handle withdrawal.

      apply_low_balance_fee if balance_low?

      return @balance
    end


    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS


    def apply_low_balance_fee
      update_balance(-LOW_BALANCE_FEE)
    end


    def balance_low?
      @balance < MINIMUM_BALANCE
    end


    def transaction_allowed?
      return false if @transactions >= TRANSACTION_LIMIT

      return true
    end
  end
end
