require "spec_helper"
require "./lib/bank_account/checking_account"

describe BankAccount::CheckingAccount do

    it "Account class is the parent of CheckingAccount" do
      expect(BankAccount::CheckingAccount.superclass).to eq(BankAccount::Account)
    end

  context "#self.new" do
    it "responds to class method called new" do
      expect(BankAccount::CheckingAccount).to respond_to :new
    end
  end # .new

  context "#withdraw" do
  let (:check_account) {BankAccount::CheckingAccount.new(123, 100_000)}
    it "returns the withdrawal amount 100 + $1 transaction fee" do
      expect(check_account.withdraw(100)).to eq(99_899)
    end
  end # withdraw

  context "#withdraw_using_check" do
    let (:check_account2) {BankAccount::CheckingAccount.new(123, 100)}
    it "returns the updated account balance of 90 when withdrawn 10" do
      expect(check_account2.withdraw_using_check(10)).to eq(90)
    end

    it "allows $-10 of overdraft protection, returns -10 balance" do
      expect(check_account2.withdraw_using_check(110)).to eq(-10)
    end

    let (:big_spender) {BankAccount::CheckingAccount.new(123, 1_000)}
    it "returns the original balance if attempt to withdraw beyond $-10" do
      expect(big_spender.withdraw_using_check(2_000)).to eq(1_000)
    end

    it "Balance after 3 $200 checks is $400" do
      3.times do
        big_spender.withdraw_using_check(200)
      end
      expect(big_spender.balance).to eq(400)
    end

    it "After 4th check of $200 ( + $2 transaction fee) balance is 198" do
      4.times do
        big_spender.withdraw_using_check(200)
      end
        expect(big_spender.balance).to eq(198)
    end

  end # withdraw_using_check

  context "#reset_checks" do
      let(:checker) {BankAccount::CheckingAccount.new(123, 5_000)}

    it "resets the check counter back to zero" do
      5.times do
        checker.withdraw_using_check(200)
      end
      expect(checker.reset_checks).to eq(0)
    end
  end # reset_checks
  
end #checkingaccount
