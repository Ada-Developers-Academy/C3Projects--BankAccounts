module BankAccount

  class SavingsAccount < Account

    def initialize(id, initial_balance)
    # checks for ArgumentError first
    raise ArgumentError.new ("You cannot open an account with less than $10")\
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
        # subtracts withdrawal and $2 transaction fee
        @current_balance = @current_balance - amount - 2
      end
    end

    def add_interest(rate)
      # must use leading zero for a rate under 1% e.g. 0.5
      interest = (@current_balance * rate/100)
      @current_balance = interest + @current_balance
      return interest
    end
  end
end
