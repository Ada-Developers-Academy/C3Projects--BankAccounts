module BankAccount

  class Account
    attr_accessor :id, :initial_balance

    def initialize(id, initial_balance)
      raise ArgumentError.new "You cannot create an account with a negative balance" unless initial_balance >= 0
        @id = id
        @initial_balance = initial_balance
    end

    # def negativebalance
    #   if @initial_balance < 0
    #   end
    # end

    def withdraw
    end

  end
end
