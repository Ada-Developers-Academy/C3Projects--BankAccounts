require 'spec_helper'
require 'bank_accounts'

describe BankAccount::Savings do

  context "when .new is called" do
    it "checks if it has two parameters" do
      expect(BankAccount::Savings).to respond_to(:new).with(2).arguments
    end
    it "does not allow initial balance to be smaller than 10" do
      expect{(BankAccount::Savings.new("carjug", 9))}.to raise_error(ArgumentError)
    end
  end
end

describe BankAccount::Savings do

  before :each do
    @savings = BankAccount::Savings.new("carjug", 20)
  end

  context "when #withdraw method is called" do
    it "has a #withdraw method" do
      expect(@savings).to respond_to(:withdraw)
    end
    it "checks if #withdraw has one parameter" do
      expect(@savings).to respond_to(:withdraw).with(1).arguments
    end

    it "does not allow account to go below 10" do
      expect{(@savings.withdraw(11))}.to raise_error(ArgumentError)
    end

    it "reduces balance by 2 each time withdraw is called and returns it" do
      expect(@savings.withdraw(3)).to eq(15)
    end

  end
end


