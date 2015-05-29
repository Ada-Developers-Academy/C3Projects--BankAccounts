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

describe BankAccount::Checking do

  before :each do
    @checking = BankAccount::Checking.new("carjug", 20)
  end

  context "when #withdraw method is called" do
    it "has a #withdraw method with one parameter" do
      expect(@checking).to respond_to(:withdraw).with(1).arguments
    end

    it "reduces balance by 1 with each withdraw and returns it" do
      expect(@checking.withdraw(3)).to eq(16)
    end
  end

  context "when #withdraw_using_check method is called" do

    it "has a #withdraw_using_check method with one parameter" do
      expect(@checking).to respond_to(:withdraw_using_check).with(1).arguments
    end

   it "allows the account to go into overdraft up to -$10" do
      expect{(@checking.withdraw_using_check(31))}.to raise_error(ArgumentError)
    end

    it "incurs a fee of $2 when check_use is > 3" do
      4.times do @checking.withdraw_using_check(1)
      end
      expect(@checking.balance).to eq(14)
    end
  end
end





