require "spec_helper"
require "./lib/bank_account/checking_account"


describe BankAccount::CheckingAccount do

  context "CheckingAccount is a child class of the parent Account Class" do
    it "Account class is the parent of CheckingAccount" do
      expect(BankAccount::CheckingAccount.superclass).to eq(BankAccount::Account)
    end
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

    let (:check_account3) {BankAccount::CheckingAccount.new(123, 100)}

    it "allows $-10 of overdraft protection, returns -10 balance" do
      expect(check_account3.withdraw_using_check(110)).to eq(-10)
    end

    let (:big_spender) {BankAccount::CheckingAccount.new(123, 1_000)}

    it "returns the original balance if attempt to withdraw beyond $-10" do
      expect(big_spender.withdraw_using_check(2_000)).to eq(1_000)
    end

    before :each do
      @checker = BankAccount::CheckingAccount.new(123, 1_000)
        3.times do
          @checker.withdraw_using_check(200)
        end
    end

    it "Balance after 3 checks is $400" do
      expect(@checker.balance).to eq(400)
    end

    before :each do
      @checker_too_much = BankAccount::CheckingAccount.new(123, 1_000)
        4.times do
          @checker.withdraw_using_check(200)
        end
    end

    it "After 4th check of 200 ( + $2 transaction fee) balance is 198" do
      expect(@checker_too_much.balace).to eq(198)
    end
      # The user is allowed three free check uses in one month
      # but any subsequent use adds a $2 transaction fee

  end # withdraw_using_check

  context "#reset_checks" do

  end

end #checkingaccount
