require "spec_helper"
require "./lib/banks/savings"

describe "BankAccount::SavingsAccount" do
  context "Making a new instance of SavingsAccount" do
    it "inherits from BankAccount::Account" do
      expect(BankAccount::SavingsAccount.superclass).to eq(BankAccount::Account)
    end

    it "retains the id and initial_balance instance variables establ. by the parent 'Account' class" do
      expect(BankAccount::SavingsAccount.new(7, 25).balance).to eq(25)
    end

    it "raises an ArgumentError if initialized with a initial_balance of < $10" do
      expect {BankAccount::SavingsAccount.new(5, 9)}.to raise_error(ArgumentError)
    end

    it "should not raise an error if you start an account balance > $10" do
      expect {BankAccount::SavingsAccount.new(2, 10)}.not_to raise_error
    end
  end

  context "Withdrawing money" do
    savings_account = BankAccount::SavingsAccount.new(87, 135)

    it "returns the current_balance after a withdrawl (includes the $2 transaction fee)" do
      expect(savings_account.withdraw(35)).to eq(98)
    end

    it "does not allow the account to go below $10 - outputs warning and returns previous balance" do
      expect{savings_account.withdraw(87)}.to output("WARNING: This account cannot go below $10.\n").to_stdout
      expect(savings_account.withdraw(87)).to eq(98) # the previous balance is 98 because of the last test (we withdrew 100)
    end
  end

  context "Adding interest" do
    savings_account = BankAccount::SavingsAccount.new(45, 10000)
    it "returns the interest using a percentage of " do
      expect(savings_account.add_interest(0.25)).to eq(25)
    end

    it "adds interest to the current balance" do
      expect(savings_account.balance).to eq(10025)
    end

    it "converts rates to a percentage if entered as a number" do
      new_account = BankAccount::SavingsAccount.new(46, 10000)
      expect(new_account.add_interest(25)).to eq(25)
    end
  end
end
