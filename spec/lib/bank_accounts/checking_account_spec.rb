require "spec_helper"
require "bank_accounts"

describe BankAccounts::CheckingAccount do
  it "responds to class method called new" do
    expect(BankAccounts::CheckingAccount).to respond_to(:new).with(2).arguments
  end

  before :each do
    @account = BankAccounts::CheckingAccount.new(1, 1000)s
  end

  it "inherits balance from parent Account" do
    expect(@account.balance).to eq(1000)
  end

  context "#withdraw method will: " do
    it "subtracts input amount from balance and charges $1 transaction fee" do
      expect(@account.withdraw(500)).to eq(499)
    end

    it "does not allow the account to go negative and returns original balance"do
      expect(@account.withdraw(1001)).to eq(1000)
    end
  end

  context "#withdraw_with_check will: " do
    it "subtract check amount from balance" do
      expect(@account.withdraw_using_check(400)).to eq(600)
    end

    it "allows overdraft of up to -$10" do
      expect(@account.withdraw_using_check(1010)).to eq(-10)
    end

    it "does not allow overdraft of more than -$10" do
      expect(@account.withdraw_using_check(1011)).to eq(1000)
    end

    it "allows three free check withdrawals" do
      3.times do @account.withdraw_using_check(100)
      end
      expect(@account.balance).to eq(700)
    end

    it "adds $2 fee for using more than three checks in one month" do
      4.times do @account.withdraw_using_check(100)
      end
      expect(@account.balance).to eq(598)
    end
  end

  #Need to fix this test to work, but method seems to work just fine
  context "#reset_checks will: " do
    it "reset checks_used to 0" do
      4.times do @account.withdraw_using_check(100)
      end
      @account.reset_checks
      expect(@checks_used).to eq(0)
    end
  end

end #describe


