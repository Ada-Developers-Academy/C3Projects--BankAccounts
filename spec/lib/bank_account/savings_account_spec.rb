require 'spec_helper.rb'
require './lib/bank_account/savings_account'
require 'pry'

describe BankAccount::SavingsAccount do

context "When you create a new savings account"

  let (:new_savings_account) {BankAccount::SavingsAccount.new(1,200)}
  let (:sad_savings_account) {BankAccount::SavingsAccount.new(1,9)}

  # Since new is a default method, perhaps
  # write a spec checking the arg number?
  it "Responds to class method called .new" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end

  it "raises an error if the initial balance is under $10" do
    expect{sad_savings_account}.to raise_error(ArgumentError)
  end

  # We could probably refactor withdraw and deposit to use parent
  #behaviors
  it "withdrawn funds include an evil fee, return new balance" do
    expect(new_savings_account.withdraw(5)).to eq(193)
  end

end
