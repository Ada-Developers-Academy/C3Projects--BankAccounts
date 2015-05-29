module BankAccounts
  require "pry"

  class Account
    attr_reader :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id

      if initial_balance < 0
        raise ArgumentError.new("You need money to open this account. Please try again")
      else
        @initial_balance = initial_balance
      end
    end

    def withdraw(amount)
      if amount > @initial_balance
        return "Insufficient funds to remove this amount. Please try a smaller amount."
      else
        @initial_balance -= amount
      end
    end



  end #class

end # module
