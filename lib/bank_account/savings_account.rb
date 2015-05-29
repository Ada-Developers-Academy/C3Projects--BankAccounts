module BankAccount

  class SavingsAccount
    attr_reader :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
      @current_balance = initial_balance

      if @initial_balance < 10
        raise ArgumentError, "You can't have negative monies!"
      end
    end



  end

end
