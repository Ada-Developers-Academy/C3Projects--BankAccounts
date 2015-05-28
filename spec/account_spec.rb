require "spec_helper"
require "bankaccount"

describe BankAccount::Account do
	
	it "responds to class method called new" do
		expect(BankAccount::Account).to respond_to :new
	end

	context "it creates an instance of a new Account with an id and a positive initial_balance" do
		let(:account) { BankAccount::Account.new(1, 500) }

		it "has the id 1" do
			expect(account.id).to eq 1
		end

		it "has an initial_balance of 500" do
			expect(account.initial_balance).to eq 500
		end

		it "raises an error if a negative initial_balance is entered" do
			expect{BankAccount::Account.new(4, -400)}.to raise_exception(ArgumentError)
		end
	end


end # describe