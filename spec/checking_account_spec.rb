require "spec_helper"
require "bankaccount"

describe BankAccount::CheckingAccount do

	it "responds to the method new" do
		expect(BankAccount::CheckingAccount).to respond_to :new
	end

	it "is a subclass of Account" do
		expect(BankAccount::CheckingAccount.ancestors).to include(BankAccount::Account)
	end


	describe "it creates an instance of a new CheckingAccount with an id 1 and a positive initial_balance 500" do
		let(:checking_account) { BankAccount::CheckingAccount.new(1, 5000) }

		it "has the id 1" do
			expect(checking_account.id).to eq 1
		end

		it "has an initial_balance of 5000" do
			expect(checking_account.initial_balance).to eq 5000
		end

		it "raises an error if a negative initial_balance is entered" do
			expect{BankAccount::CheckingAccount.new(4, -400)}.to raise_exception(ArgumentError)
		end

		context "you can withdraw money from your CheckingAccount for a 1 transaction fee, unless it would make your account balance go below 0" do
			it "returns 4498 if you withdraw 500 and it has a 1 transaction fee" do
				expect(checking_account.withdraw(500)).to eq 4499
			end
			it "raises an ArgumentError if you try to withdraw 6000" do
				expect{checking_account.withdraw(6000)}.to raise_exception(ArgumentError)
			end
		end

		context "you can deposit money in your CheckingAccount" do
			it "returns 5500 if you deposit 500" do
				expect(checking_account.deposit(500)).to eq 5500
			end
		end
	end

end