require 'spec_helper'
require './lib/bank_accounts/savings_account'

describe BankAccounts::SavingsAccount do

	let(:savings_account) { BankAccounts::SavingsAccount.new(id_option, balance_option) }
	let(:default_id)					{ 2 }
	let(:default_balance)				{ 200 }

	it "responds to class new method" do
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
	end

	context "too small initial balance" do

		it "raises ArgumentError in case of initial balance under 10" do
			expect { 
				BankAccounts::SavingsAccount.new(3, 5)
			}.to raise_error ArgumentError
		end
	end
end
