module BankAccount

  require_relative('./classes/account.rb')
  require_relative('./classes/savings_account.rb')

end

#testing
x = BankAccount::Savings.new("carjug", 12)
ap x.id
