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
  let(:money_market_account) { BankAccount::MoneyMarketAccount.new(1,20_000)
  }

  context "user can withdraw amount from account" do
    it "amount specified is subtracted from current account balance" do
      expect(money_market_account.withdraw(500)).to eq(19_500)
    end
  end

  context "user cannot overdraw their account" do
    it "returns the original prewithdraw balance when the user tries to overdraw" do
      expect(money_market_account.withdraw(20_001)).to eq(20_000)

    end
  end

  context "if the user goes below the minimum balance they are charged $100 per transaction" do
    it "withdraws ammount and charges $100 fee" do
      expect(money_market_account.withdraw(10_001)).to eq(9899)
    end
  end

  context "the user may only complete 6 money market transactions per month" do
    it "returns the pre-transaction balance if the user has used up their 6 transactions" do
    6.times do money_market_account.withdraw(10)
      end
    expect(money_market_account.withdraw(10)).to eq(19_940)
    end
  end

  context "the user can deposit money to their money markey" do
    it "adds deposit amount to balance" do
      expect(money_market_account.deposit(1000)).to eq(21_000)
    end
  end

  context "deposits count against a user's transactions" do
    it "decreases the number of available transactions" do
      money_market_account.deposit(1000)
      expect(money_market_account.transaction_count).to eq(5)
    end
  end

  context "a user can deposit enough money to put their account in good standing ($10k) at anytime regardless of their transaction count" do
    it "allows a user with 0 transactions left to bring their account into good standing ($10k)" do
        6.times do money_market_account.withdraw(2_000)
        end
      expect(money_market_account.deposit(3_000)).to eq(10_900)
    end
  end

  context "allowable transactions are reset monthly" do
    it "resets available transactions to 6" do
      money_market_account.reset_transactions
      expect(money_market_account.transaction_count).to eq(6)
    end
  end

  context "clients earn interest on their accounts" do
    it "calculates the interest accrued on an account based on the rate given" do
      expect(money_market_account.add_interest(0.25)).to eq(50)
    end
  end
end
