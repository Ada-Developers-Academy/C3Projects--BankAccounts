module BankAccounts
  require "pry"

  class Account
    attr_reader :initial_balance

    def initialize(id, initial_balance)
      @id = id

      if initial_balance < 0
        raise ArgumentError.new
      else
        @initial_balance = initial_balance
      end
    end





  end #class

end # module
