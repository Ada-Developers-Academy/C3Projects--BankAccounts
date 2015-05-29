require './lib/bank_account/savings_account'
require 'spec_helper.rb'

describe BankAccount::SavingsAccount do

  it "responds to class method called new" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end

end
