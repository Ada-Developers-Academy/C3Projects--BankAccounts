require "spec_helper"
require "bankaccount"

describe BankAccount::MoneyMarketAccount do

	it "responds to the method new" do
		expect(BankAccount::MoneyMarketAccount).to respond_to :new
	end

	it "is a subclass of Account" do
		expect(BankAccount::MoneyMarketAccount.ancestors).to include(BankAccount::Account)
	end

	it "raises an error if an initial_balance < 10,000 is entered" do
		expect{BankAccount::MoneyMarketAccount.new(4, 5000)}.to raise_exception(ArgumentError)
	end





	
	
end 