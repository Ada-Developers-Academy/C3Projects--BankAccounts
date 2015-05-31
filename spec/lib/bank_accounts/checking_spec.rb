require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::CheckingAccount do

 context "A checking account is a bank account" do
   it "CheckingAccount class inherits from Account class" do
     expect(BankAccounts::CheckingAccount.superclass).to eq(BankAccounts::Account)
   end
 end

 context "When withdrawing from a checking account (ATM)" do
  let (:checking) { BankAccounts::CheckingAccount.new(0, 80) }

  it "incurs a fee of $1 for each withdrawal and returns the updated balance" do
    expect(checking.withdraw(14)).to eq(65)
    expect(checking.withdraw(54)).to eq(10)
  end

  it "raises an error when attempting to withdraw more than the current  balance" do
    expect{ checking.withdraw(85) }.to raise_error(ArgumentError, "INSUFFICIENT FUNDS\nYour current balance is $#{checking.balance}.")
  end
 end

 context "When withdrawing using a check" do
  let (:checking) { BankAccounts::CheckingAccount.new(0, 100) }

  it "returns an updated account balance after withdrawing a check value" do
    expect(checking.withdraw_using_check(20)).to eq(80)
    expect(checking.withdraw_using_check(30)).to eq(50)
  end

  it "raises an error if overdraft below -$10" do
    expect { checking.withdraw_using_check(150) }.to raise_error(ArgumentError, "OVERDRAFT WARNING - only $10 overdraft allowed. Your current balance is #{checking.balance}.")
  end

  it "adds a $2 fee when more than 3 checks are used" do
    5.times { checking.withdraw_using_check(10) }
    expect(checking.balance).to eq(46)
  end
 end

 context "When a new month begins, checks used count is reset" do
  let (:checking) { BankAccounts::CheckingAccount.new(0, 500) }
  
  it "resets the number of used checks from 10 to 0" do
    10.times { checking.withdraw_using_check(2.6899) }
    expect(checking.checks_used).to eq(10)
    expect(checking.reset_checks).to eq(0)
  end
 end

end # describe
