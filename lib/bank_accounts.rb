module BankAccount

  require_relative('./classes/account.rb')
  require_relative('./classes/savings_account.rb')
  require_relative('./classes/checking_account.rb')

end

#testing
x = BankAccount::Checking.new("cj",20)
4.times do
  ap x.withdraw_using_check(1)
end

