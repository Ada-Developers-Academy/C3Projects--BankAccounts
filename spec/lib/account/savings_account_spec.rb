require 'spec_helper'
require 'bank_accounts'

describe "BankAccounts::SavingsAccount" do
  context "self.new(id, initial_balance)" do
    subject { BankAccounts::SavingsAccount.new(123, 1000) }

    it "responds to Account class" do
      expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
    end
  end
end
