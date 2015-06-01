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

    it "takes out $1 for each withdrawl" do
      expect(checking_account.withdraw(35)).to eq(99)
    end

    it "prints message if try to withdraw more than current balance" do
      expect{checking_account.withdraw(100)}.to output("WARNING: You cannot remove that much money from your account.\n").to_stdout
      expect(checking_account.withdraw(100)).to eq(99) # the previous balance is 99 because of the last test (we withdrew 100)
    end
  end
end
