require 'spec_helper'
require './lib/bank_accounts/checking_account'

describe BankAccounts::CheckingAccount do

	let(:checking_account) { BankAccounts::CheckingAccount.new(id_option, balance_option) }
	let(:default_id)					{ 3 }
	let(:default_balance)				{ 1000 }

	it "responds to class .new method" do
		expect(BankAccounts::CheckingAccount).to respond_to :new
	end

	context "With any CheckingAccount it..." do
		let(:id_option)			{ default_id }
		let(:balance_option)	{ default_balance }

		it "new CheckingAccount has id" do
			expect(checking_account.id).to eq(3)
		end

		it "new CheckingAccount has balance" do
			expect(checking_account.balance).to eq(1000)
		end

		it "new CheckingAccount has check count" do
			expect(checking_account.check_count).to eq(0)
		end

		it "responds to #withdraw" do
			expect(checking_account).to respond_to :withdraw
		end

		it "responds to #withdraw_using_check" do
			expect(checking_account).to respond_to :withdraw_using_check
		end

		context "withdraws an amount" do

			[
				[0,   	1000],
				[10,  	 989],
				[998,  	   1],
				[999, 	   0],
				[1000, 	1000]
			].each do |amount, new_balance|
				it "withdraws #{amount} and leaves new balance of #{new_balance}" do
					checking_account.withdraw(amount)
					expect(checking_account.balance).to eq(new_balance)
				end
			end
		end

		context "withdraws using a check" do
			before(:each) do
				checking_account.withdraw_using_check(100)
			end

			it "withdraws amount from balance" do
				expect(checking_account.balance).to eq(900)
			end

			it "increases check count by 1" do
				expect(checking_account.check_count).to eq(1)
			end

			context	"withdraws with check more than 3 times" do
				before(:each) do
					2.times do
						checking_account.withdraw_using_check(100)
					end
				end

				it "hasn't charged a fee on the first 3 withdrawals with check" do
					expect(checking_account.balance).to eq(700)
				end

				it "starts charging a 2 fee on the fourth withdrawl using check" do
					checking_account.withdraw_using_check(100)
					expect(checking_account.balance).to eq(598)
				end

				it "resets check count" do
					expect(checking_account.reset_checks).to eq(0)
				end
			end

			context "allows the balance to overdraft" do
				before(:each) do
					8.times do
						checking_account.withdraw_using_check(100)
					end
					checking_account.withdraw_using_check(90)
				end

				it "the balance can go below zero" do
					expect(checking_account.balance).to eq(-4)
				end

				it "allows the balance to overdraft up to -10" do
					checking_account.withdraw_using_check(4)
					expect(checking_account.balance).to eq(-10)
				end

				it "does not permit overdraft past -10" do
					checking_account.withdraw_using_check(4)
					checking_account.withdraw_using_check(10)
					expect(checking_account.balance).to eq(-10)
				end
			end
		end
	end

end
