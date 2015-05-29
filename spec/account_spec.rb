require 'spec_helper'
require './lib/bank_accounts/account'

describe BankAccounts::Account do

	let(:account) { BankAccounts::Account.new(id_option, balance_option) }
	let(:default_id)					{ 1 }
	let(:default_balance)				{ 100 }

	it "responds to class method new" do
		expect(BankAccounts::Account).to respond_to :new
	end

	context "With any account it..." do
		let(:id_option) 				{ default_id }
		let(:balance_option) 			{ default_balance }

		it "new account has id" do
			expect(account.id).to eq(1)
		end

		it "new account has initial balance" do
			expect(account.balance).to eq(100)		
		end

		it "responds to withdraw method" do
			expect(account).to respond_to :withdraw
		end

		context "withdraws an amount" do

			it "lowers balance by amount withdrawn" do
				account.withdraw(10)
				expect(account.balance).to eq(90)
			end

			it "returns error message if amount withdrawn is greater than balance" do
				account.withdraw(110)
				expect(account.balance).to eq(100)
			end
		end
	end

	context "invalid initial amount passed in" do

		it "raises ArgumentError in case of negative initial balance" do
			expect { 
				BankAccounts::Account.new(2, -10)
			}.to raise_error ArgumentError
		end

		it "raises ArgumentError in case of nil initial balance" do
			expect { 
				BankAccounts::Account.new(2, nil)
			}.to raise_error ArgumentError
		end
	end
end
