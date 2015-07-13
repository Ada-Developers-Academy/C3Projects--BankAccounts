
require 'spec_helper'


##note to self: class methods need module::class and instance methods need lowercaseclass.methodname
describe "savings account attributes" do
  context "responds to the account class" do
    it "responds to the function new for Account" do
      expect(BankAccount::SavingsAccount).to respond_to :new
    end
  end

  context "savings account requires $10 to open" do
    it "raise an ArgumentError when the user tries to open an account with less than $10" do
      expect{BankAccount::SavingsAccount.new(1, 5)}.to raise_error(ArgumentError)
    end
  end
end

describe "savings account methods" do
  let(:savings_account) { BankAccount::SavingsAccount.new(1, 250)}

  context "withdraws the money from the account and charges the user a $2 service fee" do
    it "subtracts $2 plus the specified ammount from the account" do
      expect(savings_account.withdraw(48)).to eq(200)
    end
  end

  context "savigns account has a minimum balance of $10" do
    it "does not process the withdraw and returns pre-withdraw balance" do
      expect(savings_account.withdraw(241)).to eq(250)
    end
  end

  context "savings account inherits methods from account" do
    it "deposits the specified ammount" do
      expect(savings_account.deposit(250)).to eq(500)
    end
  end

  context "interest rate method will calculate the amount of interest earned on the account" do
    it "returns the ammount of interest accrued" do
      expect(savings_account.add_interest(0.5)).to eq(1.25)
    end
  end
end
