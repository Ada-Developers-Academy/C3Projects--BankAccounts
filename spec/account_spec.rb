require "spec_helper"
require "bankaccount"

describe BankAccount::Account do
	
	it "responds to class method called new" do
		expect(BankAccount::Account).to respond_to :new
	end


end # describe