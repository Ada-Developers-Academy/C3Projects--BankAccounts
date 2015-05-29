module BankAccount

  class CheckingAccount < Account

    def withdraw(amount)
      super
      if @current_balance > amount
        @current_balance = (@current_balance - 1)
      else
        @current_balance
      end
    end

  end
end
