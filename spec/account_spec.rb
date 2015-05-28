require 'spec_helper'
require_relative '../lib/bank_accounts/account.rb'


describe BankAccounts::Account do

	it "responds to class method new" do
		expect(BankAccounts::Account).to respond_to :new
	end
end
