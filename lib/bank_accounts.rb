module BankAccount

  require_relative('./classes/account.rb')
  require_relative('./classes/savings_account.rb')

end

#testing
x = BankAccount::Savings.new("cj",20)
ap x.withdraw(3)
ap x.balance
ap x.add_interest(0.25)
ap x.balance
