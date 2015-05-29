require 'spec_helper'
require './lib/bank_accounts/checking_account'

describe BankAccounts::CheckingAccount do

	let(:checking_account) { BankAccounts::CheckingAccount.new(id_option, balance_option) }
	let(:default_id)					{ 2 }
	let(:default_balance)				{ 200 }

	it "responds to class .new method" do
		expect(BankAccounts::CheckingAccount).to respond_to :new
	end

end
