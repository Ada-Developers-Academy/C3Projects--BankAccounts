require 'spec_helper.rb'
require './lib/bank_account/account'
require 'pry'

describe BankAccount::Account do

  context "Instantiating a new account" do
    # Thanks Chef!
    # This 'let' statement allows you to create a variable called 'new account'
    # that runs something. This variable only works for this one context.

    let (:new_account) {BankAccount::Account.new(1,200)}
    let (:sad_account) {BankAccount::Account.new(2,-1)}

    it "responds to class method called .new" do
      expect(BankAccount::Account).to respond_to :new
    end

    it "throws an error when you open an account with a negative balance" do
      expect{sad_account}.to raise_error(ArgumentError)
    end

  end

  context "ATM transactions" do

    let (:new_account) {BankAccount::Account.new(1,50)}

    it "lets you withdraw moneh and returns new balance" do
      expect(new_account.withdraw(5)).to eq(45)
    end

    it "won't let you overdraft" do
      expect(new_account.withdraw(51)).to eq("Sorry, you don't have that much! Withdrawal canceled. Let's keep your current balance at 50.")
    end

    it "lets you to deposit moneh" do
      expect(new_account.deposit(5)).to eq(55)
    end

    it "lets you check current balance" do
      expect(new_account.balance.to eq(50))
    end

  end
end
