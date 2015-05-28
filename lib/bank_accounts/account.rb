module BankAccounts

  class Account

    attr_accessor :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
    end

  end

end
