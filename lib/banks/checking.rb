require "pry"
module BankAccount
  class CheckingAccount < Account
      MINIMUM_BALANCE = 0
      TRANSACTION_FEE = 1

    def withdraw(amount)
      if (amount + MINIMUM_BALANCE + TRANSACTION_FEE) > @current_balance
        # accounts are not allowed to go below $0
        # #withdraw will return the previous balance
        puts "WARNING: This account cannot go below $0."
        return @current_balance
      else
        return @current_balance -= (amount + TRANSACTION_FEE)
      end
    end
  end
end
