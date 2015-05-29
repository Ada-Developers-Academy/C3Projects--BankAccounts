require 'pry'

module BankAccounts
  class SavingsAccount < Account

    def initialize(id, balance)
      super
    end

    binding.pry
  end # class
end # module
