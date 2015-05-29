# Note for later: Do I need this to be in a module? Was in Scrabble, wasn't in FarMar
# require 'spec_helper'
# require gems
module BankAccounts
  # require 'money'
  require 'pry'

  # require dependent files
  require_relative 'bankaccounts/account'
  require_relative 'bankaccounts/savings-account'
  require_relative 'bankaccounts/checking-account'

end
