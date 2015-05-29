module BankAccount

  class Account
    attr_accessor :id, :initial_balance, :current_balance

    def initialize(id, initial_balance)
      raise ArgumentError.new ("You cannot create an account with a negative balance") \
        unless initial_balance > 0
      @id = id
      @initial_balance = initial_balance
      @current_balance = initial_balance
    end

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

    def balance
      return @current_balance
    end

    ## should you write into your current class the fee modification structure
    ## so you don't have to call all that within the child classes? They are children
    ## you probably should try to leave less up to them

  end
end
