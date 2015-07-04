module BankAccount
  require 'pathname'

  ROOT_DIR = Pathname.new(__dir__).parent
  require ROOT_DIR.join('lib/bankaccount/account')
  require ROOT_DIR.join('lib/bankaccount/savingsaccount')
  require ROOT_DIR.join('lib/bankaccount/checkingaccount')

end
