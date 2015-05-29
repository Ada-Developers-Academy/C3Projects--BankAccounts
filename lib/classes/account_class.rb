module BankAccount

  class Account
    attr_accessor :id, :initial_balance, :current_balance

    def initialize(id, initial_balance)
      raise ArgumentError.new ("You cannot create an account with a negative balance") unless initial_balance > 0
        @id = id
        @initial_balance = initial_balance
        @current_balance = initial_balance
    end

    def withdraw(amount)
      if amount > @current_balance
        puts "#{amount} is too large of of a withdrawal. Your current balance is #{@current_balance}."
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

  end
end
