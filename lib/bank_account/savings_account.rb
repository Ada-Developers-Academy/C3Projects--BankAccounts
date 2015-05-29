module BankAccount
  class SavingsAccount

    def initialize(id, initial_balance)
      @id = id
      if initial_balance < 10
        raise ArgumentError, "Savings account cannot initialize with only #{initial_balance}."
      else
        @balance = initial_balance
      end
    end


  end
end