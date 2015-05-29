require 'spec_helper'

describe "checking account attributes" do

  context "checking account inherits initialize method from account" do
    it "creates a new checking account given the id and initial balance" do
      expect(BankAccount::CheckingAccount).to respond_to :new
    end
  end
end

describe "checking account methods" do
  let(:checking_account) { BankAccount::CheckingAccount.new(1,250)}

  context "withdraw removes specified amount from the account and incurs a $1 fee" do
    it "subtracts specified amount plus $1 fee from account balance" do
      expect(checking_account.withdraw(5)).to eq(244)
    end
  end

  context "cannot overwithdraw on account" do
    it "returns the pre-withdraw balance" do
      expect(checking_account.withdraw(250)).to eq (250)
    end
  end

  context "users may withdraw using a check" do
    it "subtracts the specified amount from the balance" do
      expect(checking_account.withdraw_using_check(50)).to eq(200)
    end
  end

  context "users may overdraft up to $10" do
    it "returns the pre-withdraw balance if the user's post withdraw balance would be less than -$10" do
      expect(checking_account.withdraw_using_check(261)).to eq(250)
    end
  end

  context "each month the user is allowed 3 free withdrawls" do
    it "tracks the amount of checks(check count) after each withdraw" do
      checking_account.withdraw_using_check(10)
      expect(checking_account.check_count).to eq(2)
    end
  end

  context "after the user has used their free withdraws they incur a $2 transaction fee for each withdraw" do
    it "withdraws the amount requested and if the check count < 1 it will charge an additional $2 fee" do
      3.times do checking_account.withdraw_using_check(10)
      end
      expect(checking_account.withdraw_using_check(10)).to eq(208)
    end
  end

  context "every month the user's free withdraws are reset" do
    it "resets the check count to 3" do
      checking_account.reset_checks
      expect(checking_account.check_count).to eq(3)
    end
  end
end
