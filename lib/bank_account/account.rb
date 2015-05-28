require 'pry'

module BankAccount

  class Account
  attr_reader :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance
    end
  end
end
