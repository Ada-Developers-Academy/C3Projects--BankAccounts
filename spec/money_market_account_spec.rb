require 'spec_helper'

describe "money market account attributes" do

  context "money market inherits from the account class" do
    it "creates a new money market account given the id and initial balance" do
      expect(BankAccount::MoneyMarketAccount).to respond_to :new
    end
  end

  context "you can not open a money market account with less than $10,000" do
    it "gives an error to the user when trying to open an account with less than $10k" do
      expect{BankAccount::MoneyMarketAccount.new(1, 9999)}.to raise_error(ArgumentError)
    end
  end
end

describe "money market account methods" do
  context ""

end
