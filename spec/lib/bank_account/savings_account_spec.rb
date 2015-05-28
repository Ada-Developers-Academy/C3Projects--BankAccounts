require 'spec_helper.rb'
require './lib/bank_account/savings_account'


describe BankAccount::SavingsAccount do

  it "Responds to class method called .new" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end


end
