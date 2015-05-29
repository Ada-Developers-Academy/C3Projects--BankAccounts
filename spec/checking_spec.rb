require "spec_helper"
require "./lib/banks/checking"

describe "BankAccount::CheckingAccount" do
  context "Making a new instance of BankAccount::CheckingAccount" do
    it "inherits from BankAccount::Account" do
      expect(BankAccount::CheckingAccount.superclass).to eq(BankAccount::Account)
    end

    it "retains the id and initial_balance instance variables establ. by the parent 'Account' class" do
      expect(BankAccount::CheckingAccount.new(7, 25).balance).to eq(25)
    end
  end

  context "Withdrawing money" do
    checking_account = BankAccount::CheckingAccount.new(87, 135)

    it "returns the current_balance after a withdrawl (includes the $1 transaction fee)" do
      expect(checking_account.withdraw(35)).to eq(99)
    end
  end
end
