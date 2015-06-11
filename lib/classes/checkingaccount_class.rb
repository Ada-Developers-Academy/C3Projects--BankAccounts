module BankAccount

  class CheckingAccount < Account
    attr_reader :checks

    #inherits passed in parameters from Account class
    def initialize(id, initial_balance)
    super(id, initial_balance)
    @current_balance = initial_balance
    @checks = 0
    end

    # used super to inherit functionality for overdraft
    # may not be the best use of super since still needed the if/else block for the transaction fee
    # could potentially refactor Account #withdraw to use a variable that accounts for fees/minimum balances
    # but seems like it may be a little more complicated than needed
    def withdraw(amount)
      super
      if @current_balance > amount
        @current_balance = (@current_balance - 1)
      else
        @current_balance
      end
    end

    def withdraw_using_check(amount)
      # controls for overdraft of up to $10
      if amount > @current_balance + 10
        puts "$#{amount} is too large of of a withdrawal. Your current balance is $#{@current_balance}."
        return @current_balance
      # 3 free check withdrawals
      elsif @checks < 3
      @current_balance = @current_balance - amount
      # once @checks > 3, charges $2 transaction fee
      else
      @current_balance = @current_balance - amount - 2
      end
      # increases checks count each time method is called
      @checks += 1
      return @current_balance
    end

    def reset_checks
      @checks = 0
    end
  end
end
