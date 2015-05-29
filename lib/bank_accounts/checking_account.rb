module BankAccounts
  require "pry"

  class CheckingAccount < Account

    def withdraw(amount)

      amount += 1
      if (@balance - amount) < 0
        return "Insufficient funds. Please withdraw a smaller amount."
      end

      super

    end

  end #class

end #module
