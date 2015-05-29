require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::Account do

  context "When creating a Bank account" do
    it "responds to Account instantiation with 2 arguments" do
      expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
    end

    it "raises an error when account is created with a negative balance" do
      expect{ BankAccounts::Account.new(0, -1) }.to raise_error(ArgumentError, "Sorry, you can't have a negative balance")
    end
  end

  context "When withdrawing money from account" do
    let(:account) { BankAccounts::Account.new(0, 200) }

    it "responds to withdraw(amount)" do
      expect(account).to respond_to(:withdraw)
    end

    it "returns an updated account balance when withdrawing money" do
      expect(account.withdraw(10)).to eq(190)
    end

    it "raises an error when the account is overdrawn" do
      expect{account.withdraw(500)}.to raise_error(ArgumentError, "WARNING you have overdrawn your account. Your current balance is #{account.balance}.")
    end
  end # context

end # describe