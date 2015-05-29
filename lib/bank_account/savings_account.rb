module BankAccount


  class SavingsAccount < Account

    attr_reader :id, :initial_balance
    attr_accessor :current_balance

    def initialize(id, initial_balance)
      #Inherit the same variables as Account
      super

      if @initial_balance < 10
        raise ArgumentError, "You can't have less than 10 whole bucks!"
      end
    end

    def withdraw(get_monies)

      # All of this behavior is unique. So I
      # don't think I can call super...
      highway_robbery = get_monies + 2

      if @current_balance - highway_robbery > 10
        @current_balance -= highway_robbery
      else
        return "Sorry, you need a minimum of ten whole bucks in your account. Withdraw canceled. Let's keep your current balance at #{@current_balance}."
      end

    end

    def add_interest(rate)
      interest = @current_balance * (rate/100)
    end

  end #class

end #module
