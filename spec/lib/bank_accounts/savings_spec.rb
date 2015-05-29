require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::SavingsAccount do
  
  context "A savings account is a bank account" do
    it "inherits from class Account" do
      expect(BankAccounts::SavingsAccount.superclass).to eq(BankAccounts::Account)
    end
  end

  context "When creating a savings bank account" do
    it "responds to savings account instantiation with 2 arguments" do
      expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
    end

    it "raises an error when a savings account with a balance below $10" do
      expect{ BankAccounts::SavingsAccount.new(0, 5) }.to raise_error(ArgumentError, "MINIMUM BALANCE $10 REQUIRED")
    end

    it "raises an error when a savings account with a balance below $0" do
      expect{ BankAccounts::SavingsAccount.new(0, -35) }.to raise_error(ArgumentError, "MINIMUM BALANCE $10 REQUIRED")
    end
  end

  context "When withdrawing money from bank account" do
    let(:savings) { BankAccounts::SavingsAccount.new(0, 5000) }

    it "responds to withdraw(amount)" do
      expect(savings).to respond_to(:withdraw)
    end

    it "raises an error when the account is overdrawn" do
      expect{savings.withdraw(10000)}.to raise_error(ArgumentError, "INSUFFICIENT FUNDS\nYour current balance is $#{savings.balance}.")
    end

    it "incurs a fee of $2 for each withdrawal - returns updated balance" do
      expect(savings.withdraw(500)).to eq(4498)
    end
  end


end # describe

# Requirements for class SavingsAccount --------------------------------->

# Create a `SavingsAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class. It should include updated logic within the following methods:
# - `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
#   - The initial balance cannot be less than $10. If it is, this will `raise` an `ArgumentError`
# - `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction. Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
#   - Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance
