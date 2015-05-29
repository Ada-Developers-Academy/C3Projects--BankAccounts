module BankAccount

  class CheckingAccount < Account

    def initialize(id, initial_balance)
    super(id, initial_balance)
    @current_balance = initial_balance
    @checks = 0
    end

    def withdraw(amount)
      super
      if @current_balance > amount
        @current_balance = (@current_balance - 1)
      else
        @current_balance
      end
    end

    def withdraw_using_check(amount)
      if amount > @current_balance + 10
        puts "$#{amount} is too large of of a withdrawal. Your current balance is $#{@current_balance}."
        return @current_balance
      elsif @checks <= 3
      @current_balance = @current_balance - amount
      else
      @current_balance = @current_balance - amount - 2
      end
      @checks += 1
      return @current_balance
    end



  end
end
