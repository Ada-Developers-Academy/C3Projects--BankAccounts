# Note for later: Do I need this to be in a module? Was in Scrabble, wasn't in FarMar
# require 'spec_helper'
# require gems
module BankAccounts
  # require 'money'
  require 'pry'

  # require dependent files
  require_relative 'bankaccounts/account'
  require_relative 'bankaccounts/savings-account'
end

# FOR ADD'L TESTING PURPOSES
# acct = BankAccounts::Account.new(937, 7000)
# puts acct.deposit(100)
# puts acct.withdraw(1000)
# puts acct.deposit(2000)
# puts acct.withdraw(18)
# puts acct.balance
# puts acct.withdraw(10000)
# puts acct.balance
