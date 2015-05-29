require 'spec_helper'
require 'bank_accounts'

describe BankAccount::Checking do

  context "when .new is called" do
    it "checks if it has two parameters" do
      expect(BankAccount::Checking).to respond_to(:new).with(2).arguments
    end
    it "does not allow initial balance to be negative" do
      expect{(BankAccount::Checking.new("carjug", -9))}.to raise_error(ArgumentError)
    end
  end

end
