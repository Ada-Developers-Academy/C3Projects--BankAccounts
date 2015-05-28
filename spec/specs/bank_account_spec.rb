require 'spec_helper'
require 'bank_accounts'

describe BankAccount::Account do

  context "when .new is called" do
    it "checks if it has two parameters" do
      expect(BankAccount::Account).to respond_to(:new).with(2).arguments
    end
  end

  it "accepts no negatives for initial balance" do
    expect{(BankAccount::Account.new("carjug", -7))}.to raise_error(ArgumentError)
  end
end

