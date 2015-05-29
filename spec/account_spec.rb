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

		it "responds to #withdraw" do
			expect(account).to respond_to :withdraw
		end

		it "responds to #deposit" do
			expect(account).to respond_to :deposit
		end

		context "withdraws an amount" do

			it "lowers balance by amount withdrawn" do
				account.withdraw(10)
				expect(account.balance).to eq(90)
			end

			it "puts error message if amount withdrawn is greater than balance" do
				account.withdraw(110)
				expect(account.balance).to eq(100)
			end
		end

		context "balance increases by deposited amount" do
			[
				[10, 110],
				[50.50, 150.50]
			].each do |amount, new_balance|
				it "after depositing #{amount}, balance is #{new_balance}" do
					account.deposit(amount)
					expect(account.balance).to eq(new_balance)
				end
			end
		end
	end

	context "invalid initial amount passed in" do

		[
			[2, -10],
			[2, nil]
		].each do |id, initial_balance|
			it "raises ArgumentError in case of initial balance of #{initial_balance}" do
			expect { 
				BankAccounts::Account.new(id, initial_balance)
			}.to raise_error ArgumentError
			end
		end
	end
end
