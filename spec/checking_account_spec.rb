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

		it "responds to #withdraw" do
			expect(checking_account).to respond_to :withdraw
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
	end

end
