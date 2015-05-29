module BankAccount

  class SavingsAccount < Account

    def initialize(id, initial_balance)
    raise ArgumentError.new ("You cannot create an account with a negative balance")\
      unless initial_balance >= 10
    @id = id
    @initial_balance = initial_balance
    @current_balance = initial_balance
    end

    def withdraw(amount)
      if amount > @current_balance - 10
        puts "$#{amount} is too large of of a withdrawal.\nYou must leave $10 in your account and your current balance is $#{@current_balance}."
        return @current_balance
      else
        @current_balance = @current_balance - amount - 2
      end
    end

    def add_interest(rate)
      interest = (@current_balance * rate/100)
      @current_balance = interest + @current_balance
      return interest
    end
  end
end
