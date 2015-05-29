# Create a MoneyMarketAccount class with a minimum of 6 specs. The class should inherit behavior from the Account class.
#
# A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this account type
# self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned
# The initial balance cannot be less than $10,000.
# #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction.
# If a withdrawal causes the balance to go below $10,000, a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction.
# Each transaction will be counted against the maximum number of transactions
# #deposit(amount)
# Each transaction will be counted against the maximum number of transactions
# Exception to the above: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.
# #add_interest(rate): Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance). Note** This is the same as the SavingsAccount interest.
# #reset_transactions: Resets the number of transactions to zero

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
        unless transaction_allowed? # if transaction is allowed, don't raise an error!
          raise ArgumentError.new("You cannot make any additional deposits this month. You have already reached the limit (#{ TRANSACTION_LIMIT }).")
        else # when it is allowed, increment transactions counter.
          @transactions += 1
        end
      end

      if super(amount) # call parent method to handle deposit.
        return true #!Q does this need to be a conditional?
      else
        return false
      end
    end

    def reset_transactions
      @transactions = 0

      return true
    end


    # withdraw money from account.
    def withdraw(amount)
      # raise an error if balance is low. otherwise, do this stuff:
      unless balance_low?
        # raise an error if transaction is not permitted. otherwise, increment transactions counter.
        if transaction_allowed?
          @transactions += 1
        else
            raise ArgumentError.new("You cannot make any additional withdrawals this month. You have already reached the limit (#{ TRANSACTION_LIMIT }).")
        end

      else
        raise ArgumentError.new("You cannot make any additional withdrawals until your balance is above the minimum: $#{ MINIMUM_BALANCE }. Your balance is only: $ #{ @balance }.")
      end

      if super(amount) # call parent to handle withdrawal.
        if balance_low?
          apply_low_balance_fee
        end

        return true
      else
        return false
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
