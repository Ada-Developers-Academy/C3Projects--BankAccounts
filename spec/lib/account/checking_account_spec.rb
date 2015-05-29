require 'spec_helper'
require 'bank_accounts'

describe "BankAccounts::CheckingAccount" do
  context "self.new(id, initial_balance)" do

    subject { BankAccounts::CheckingAccount.new(123, 1000) }

    it "responds to CheckingAccount class" do
      expect(BankAccounts::CheckingAccount).to respond_to(:new).with(2).arguments
    end

    it "assigns an id" do
      expect(subject.id).to eq(123)
    end

    it "assigns an initial balance" do
      expect(subject.balance).to eq(1000)
    end
  end

  context ".withdraw(amount)" do

    subject { BankAccounts::CheckingAccount.new(123, 1000) }

    it "responds to CheckingAccount instance" do
      expect(subject).to respond_to(:withdraw).with(1).arguments
    end

    it "subtracts given amount plus $1 fee from balance" do
      expect(subject.withdraw(49)).to eq(950)
    end
  end

  context "withdraw_using_check(amount)" do

    subject { BankAccounts::CheckingAccount.new(532156, 1000) }

    it "responds to CheckingAccount instance" do
      expect(subject).to respond_to(:withdraw_using_check).with(1).arguments
    end

    it "subtracts given amount from balance if check count is equal to 3" do
      subject.check_count = 3
      subject.withdraw_using_check(300)

      expect(subject.balance).to eq(700)
    end

    it "subtracts given amount from balance if check count is less than 3" do
      subject.check_count = 1
      subject.withdraw_using_check(300)

      expect(subject.balance).to eq(700)
    end

    it "subtracts given amount plus $2 fee from balance if check count is greater than 3" do
      subject.check_count = 4
      subject.withdraw_using_check(300)

      expect(subject.balance).to eq(698)
    end

    it "raises error if given amount is not a number" do
      expect{ subject.withdraw_using_check("abc") }.to raise_error("Parameter must be a number")
    end
  end

  context ".reset_checks"

    subject { BankAccounts::CheckingAccount.new(9999, 1000) }

    it "responds to CheckingAccount instance" do
      expect(subject).to respond_to(:reset_checks)
    end

    it "resets check_count back to zero" do
      subject.check_count = 5
      subject.reset_checks
      
      expect(subject.check_count).to eq(0)
    end
end
