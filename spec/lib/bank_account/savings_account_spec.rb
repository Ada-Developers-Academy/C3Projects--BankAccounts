require 'spec_helper.rb'
require './lib/bank_account/savings_account'
require 'pry'

describe BankAccount::SavingsAccount do

context "When you create a new savings account"

  let (:sad_account) {BankAccount::SavingsAccount.new(1,9)}

  # Since new is a default method, perhaps
  # write a spec checking the arg number?
  it "Responds to class method called .new" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end

  it "raises an error if the initial balance is under $10" do
    expect{sad_account}.to raise_error(ArgumentError)
  end


end
