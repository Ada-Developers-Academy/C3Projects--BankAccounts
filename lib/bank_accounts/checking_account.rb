module BankAccounts
  require "pry"

  class CheckingAccount < Account

  def initialize (id, initial_balance)
    super
    @checks_used = 0
  end

    def withdraw(amount)
      # adds $1 transaction fee
      # returns error message if balance drops below zero
      amount += 1
      if (@balance - amount) < 0
        puts "Insufficient funds. Please withdraw a smaller amount."
        return @balance
      end

      super
    end

    def withdraw_using_check(amount)
      # if more than three checks have been used, adds $2 fee
      if @checks_used >= 3
        amount += 2
      end

      # allows for negative balance of up to -$10
      if (@balance - amount) < (@balance - (@balance + 10))
        puts "Insufficient funds. Please withdraw a smaller amount."
        return @balance
      else
        @checks_used += 1
        return @balance -= amount
      end
    end
  end #class
end #module
