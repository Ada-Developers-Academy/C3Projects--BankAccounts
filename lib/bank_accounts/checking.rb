require 'pry'

module BankAccounts
  class CheckingAccount < Account

    def initialize(id, initial_balance)
      super
    end

    def withdraw(amount)
      #incur a fee of $1 with each withdrawal
      amount += 1

      super
    end
binding.pry
  end # class
end # module