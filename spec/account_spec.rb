require 'spec_helper'
require './lib/bank_accounts/account'

describe BankAccounts::Account do

	let(:account) { BankAccounts::Account.new(id_option, initial_balance_option) }
	let(:default_id)					{ 1 }
	let(:default_initial_balance)		{ 100 }

		it "responds to class method new" do
			expect(BankAccounts::Account).to respond_to :new
		end

	context "With any account it..." do
		let(:id_option) 				{ default_id }
		let(:initial_balance_option) 	{ default_initial_balance }

		it "new account has id" do
			expect(account.id).to eq(1)
		end

		it "new account has initial_balance" do
			expect(account.initial_balance).to eq(100)		
		end
	end

	context "Negative initial amount passed in" do

		it "raises ArgumentError in case of negative initial_balance" do
			expect { 
				BankAccounts::Account.new(2, -10)
			}.to raise_error ArgumentError
		end
	end
end
