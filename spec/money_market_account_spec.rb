require 'spec_helper'
require './lib/bank_accounts/money_market_account'

describe BankAccounts::MoneyMarketAccount do

	let(:money_market_account) { BankAccounts::MoneyMarketAccount.new(id_option, balance_option) }
	let(:default_id)					{ 4 }
	let(:default_balance)				{ 20000 }

	it "responds to class method new" do
		expect(BankAccounts::MoneyMarketAccount).to respond_to :new
	end

	context "too small initial balance" do

		[
			[5,  100],
			[5, 9000],
			[5,	   1],
			[5,    0],
			[5,  -10]
		].each do |id, initial_balance|
			it "raises ArgumentError in case of initial balance of #{initial_balance}" do
				expect { 
					BankAccounts::MoneyMarketAccount.new(id, initial_balance)
				}.to raise_error ArgumentError
			end
		end
	end

	context "With any money market account it..." do
		let(:id_option) 				{ default_id }
		let(:balance_option) 			{ default_balance }

		it "new money market account has id" do
			expect(money_market_account.id).to eq(4)
		end

		it "new account has initial balance" do
			expect(money_market_account.balance).to eq(20000)		
		end

		it "has a transaction count" do
			expect(money_market_account.transactions_remaining).to eq(6)
		end

		it "responds to #withdraw" do
			expect(money_market_account).to respond_to :withdraw
		end

		it "responds to #deposit" do
			expect(money_market_account).to respond_to :deposit
		end

		context "balance increases by deposited amount" do
			[
				[10,    20_010],
				[50000, 70_000]
			].each do |amount, new_balance|
				it "after depositing #{amount}, balance is #{new_balance}" do
					money_market_account.deposit(amount)
					expect(money_market_account.balance).to eq(new_balance)
				end
			end
		end

		context "withdraws an amount" do

			it "lowers balance by amount withdrawn" do
				money_market_account.withdraw(1000)
				expect(money_market_account.balance).to eq(19_000)
			end

			it "lowers transactions_remaining after withdrawal" do
				money_market_account.withdraw(1000)
				expect(money_market_account.transactions_remaining).to eq(5)
			end

			it "puts error message if withdrawal takes balance below 10k" do
				money_market_account.withdraw(11000)
				expect(money_market_account.balance).to eq(8900)
			end
		end

		context "deposits to bring the balance > 10000 don't count affect transactions_remaining" do
			before(:each) do
				money_market_account.withdraw(11000)
			end

			it "balance is below 10k" do
				expect(money_market_account.balance).to eq(8900)
			end

			it "transactions remaining lowers after withdrawal below 10k" do
				expect(money_market_account.transactions_remaining).to eq(5)
			end

			it "does not allow more withdrawals, and doesn't lower transactions_remaining" do
				money_market_account.withdraw(1000)
				expect(money_market_account.balance).to eq(8900)
				expect(money_market_account.transactions_remaining).to eq(5)
			end

			it "allows a deposit without lowering transactions_remaining" do
				money_market_account.deposit(1200)
				expect(money_market_account.balance).to eq(10100)
				expect(money_market_account.transactions_remaining).to eq(5)
			end
		end

		context "only 6 transactions permitted per month" do
			before(:each) do
				3.times do
					money_market_account.withdraw(1000)
					money_market_account.deposit(500)
				end
			end

			it "after 6, zero transactions remaining" do
				expect(money_market_account.transactions_remaining).to eq(0)
			end

			it "doesn't allow any more transactions" do
				expect(money_market_account.withdraw(100)).to be_nil
			end

			it "can reset transactions" do
				money_market_account.reset_transactions
				expect(money_market_account.transactions_remaining).to eq(6)
			end
		end

		context "adds interest" do

			[
				[1, 	  200],
				[0.25, 	  50],
				[5,		 1000],
				[0,		  0],
			].each do |rate, interest|
				it "adds interest to account at a rate of #{rate} and returns #{interest}" do
					expect(money_market_account.add_interest(rate)).to eq(interest)
				end
			end
		
			[
				[1, 	20200],
				[0.25, 	20050],
				[5,		21000],
				[0,		20000]
			].each do |rate, new_balance|
				it "adding interest at rate of #{rate} yields new balance of #{new_balance}" do
					money_market_account.add_interest(rate)
					expect(money_market_account.balance).to eq(new_balance)
				end
			end

			it "raises ArgumentError in case of negative rate" do
				expect { 
					money_market_account.add_interest(-2)
				}.to raise_error ArgumentError
			end
		end
	end
end
