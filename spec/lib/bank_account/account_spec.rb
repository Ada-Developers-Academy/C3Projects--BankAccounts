require 'spec_helper.rb'
require './lib/bank_account/account'


describe BankAccount::Account do

  it "Responds to class method called .new" do
    expect(BankAccount::Account).to respond_to :new
  end


end
