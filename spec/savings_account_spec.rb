require 'spec_helper'
require './lib/bank_accounts/savings_account'

describe BankAccounts::SavingsAccount do

	let(:savings_account) { BankAccounts::SavingsAccount.new(id_option, balance_option) }
	let(:default_id)					{ 2 }
	let(:default_balance)				{ 200 }

	it "responds to class .new method" do
		expect(BankAccounts::SavingsAccount).to respond_to :new
	end


	context "With any SavingsAccount it..." do
		let(:id_option)			{ default_id }
		let(:balance_option)	{ default_balance }

		it "new savings_account has id" do
			expect(savings_account.id).to eq(2)
		end

		it "new savings_account has balance" do
			expect(savings_account.balance).to eq(200)
		end

		it "responds to #withdraw" do
			expect(savings_account).to respond_to :withdraw
		end

		context "withdraws an amount" do

			[
				[0,   200],
				[10,  188],
				[188,  10],
				[189, 200],
				[200, 200]
			].each do |amount, new_balance|
				it "withdraws #{amount} and leaves new balance of #{new_balance}" do
					savings_account.withdraw(amount)
					expect(savings_account.balance).to eq(new_balance)
				end
			end

			it "puts error message if amount withdrawn is greater than minimum balance" do
				savings_account.withdraw(195)
				expect(savings_account.balance).to eq(200)
			end
		end

		context "adds interest" do

			[
				[1, 	  2],
				[0.25, 	  0.5],
				[5,		 10],
				[0,		  0],
			].each do |rate, interest|
				it "adds interest to account at a rate of #{rate} and returns #{interest}" do
					expect(savings_account.add_interest(rate)).to eq(interest)
				end
			end
		
			[
				[1, 	202],
				[0.25, 	200.5],
				[5,		210],
				[0,		200]
			].each do |rate, new_balance|
				it "adding interest at rate of #{rate} yields new balance of #{new_balance}" do
					savings_account.add_interest(rate)
					expect(savings_account.balance).to eq(new_balance)
				end
			end

			it "raises ArgumentError in case of negative rate" do
				expect { 
					savings_account.add_interest(-2)
				}.to raise_error ArgumentError
			end
		end
	end

	context "too small initial balance" do

		it "raises ArgumentError in case of initial balance between 0 and 10" do
			expect { 
				BankAccounts::SavingsAccount.new(3, 5)
			}.to raise_error ArgumentError
		end

		it "raises ArgumentError in case of negative initial balance" do
			expect { 
				BankAccounts::SavingsAccount.new(3, -5)
			}.to raise_error ArgumentError
		end
	end

end
