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

  it "won't let you dip under $10" do
    expect(new_savings_account.withdraw(195)).to eq("Sorry, you need a minimum of ten whole bucks in your account. Withdraw canceled. Let's keep your current balance at 200.")
  end

  it "lets you deposit moneh" do
    expect(new_savings_account.deposit(5)).to eq(205)
  end

  it "lets you check interest" do
    expect(new_savings_account.add_interest(0.25)).to eq(0.5)
  end

end
