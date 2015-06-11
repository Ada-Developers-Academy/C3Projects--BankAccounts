module BankAccount

  class Account
    # changed to a reader since it doesn't seem like these attributes should be able to be overwritten
    attr_reader :id, :initial_balance, :current_balance

    def initialize(id, initial_balance)
      raise ArgumentError.new ("You cannot create an account with a negative balance") \
        unless initial_balance > 0
      @id = id
      @initial_balance = initial_balance
      # sets current_balance to initial_balance during initialization
      @current_balance = initial_balance
    end

    # possible refactor could do a check on account type to be able to account for minimum balances
    # and transaction fees-- hard time visualizing how that would best work
    def withdraw(amount)
      if amount > @current_balance
        puts "$#{amount} is too large of of a withdrawal. Your current balance is $#{@current_balance}."
        return @current_balance
      else
        @current_balance = @current_balance - amount
      end
    end

    def deposit(amount)
      @current_balance = @current_balance + amount
    end

    # seems a little redundant with an attr_reader that can call current_balance
    def balance
      return @current_balance
    end
  end
end
