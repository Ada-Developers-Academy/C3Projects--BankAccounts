require "pry"
module BankAccount
  class CheckingAccount < Account
      MINIMUM_BALANCE = 0
      TRANSACTION_FEE = 1

    def withdraw(amount)
      # This method inherits from the Account class #withdraw(amount) method
      # amount will be checked against current_balance to make sure you have
      # enough money in your account to make this withdrawl (leaving at least
      # $10 left in the account)
      amount = amount + MINIMUM_BALANCE + TRANSACTION_FEE
      # need to add MINIMUM_BALANCE back on the current_balance
      super + MINIMUM_BALANCE
    end
  end
end
