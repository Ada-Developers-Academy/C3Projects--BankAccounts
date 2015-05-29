require "spec_helper"
require "bankaccount"

describe BankAccount::SavingsAccount do

	it "responds to the method new" do
		expect(BankAccount::SavingsAccount).to respond_to :new
	end

	it "is a subclass of Account" do
		expect(BankAccount::SavingsAccount.ancestors).to include(BankAccount::Account)
	end

	context "SavingsAccount must be created with an initial_balance >= 10" do
		it "raises an ArgumentError if you try to create a SavingsAccount with an initial balance < 10" do
			expect{ BankAccount::SavingsAccount.new(1,3) }.to raise_error(ArgumentError)
		end
	end

	describe "a SavingsAccount instance with an initial balance of 5000" do
		let(:savings_account) { BankAccount::SavingsAccount.new(1,5000) }

		describe "your SavingsAccount cannot have a balance < 10" do
			it "raises an ArgumentError if you try to withdraw an amount that would make your account balance < 10" do
				expect(savings_account.withdraw(4999)).to raise_error(ArgumentError)
			end
		end

	end # describe instance

end #describe class