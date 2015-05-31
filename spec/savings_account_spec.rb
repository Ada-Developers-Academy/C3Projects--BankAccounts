require "spec_helper"
require "./lib/bank_accounts/account"
require "./lib/bank_accounts/savings_account"

describe BankAccount::SavingsAccount  do

  describe "class method" do
    it "responds to 'new'" do
    expect(BankAccount::SavingsAccount).to respond_to :new
    end
  end

  describe "attributes" do
    let(:savings_account) {BankAccount::SavingsAccount.new(2, 400)}

    it "checks that saving account has id 2" do
      expect(savings_account.id).to eq 2
    end

    it "checks that saving account has balance $400" do
      expect(savings_account.balance).to eq 400
    end

    it "raises ArgumentError if balance is less than $10" do
      expect{BankAccount::SavingsAccount.new(2, 9)}.to raise_error(ArgumentError)
    end
  end

  describe "withdraw method" do
   let(:savings_account) {BankAccount::SavingsAccount.new(2, 400)}

    it "checks that each withdrawal transaction incurs a fee of $2" do
      expect(savings_account.withdraw(200)).to eq 198
      expect(savings_account.withdraw(96)).to eq 100
    end

    it "returns un-modified balance if balance would go below $10" do
      expect(savings_account.withdraw(200)).to eq 198
      expect(savings_account.withdraw(188)).to eq 198
    end
  end

  describe "add_interest method" do
   let(:savings_account) {BankAccount::SavingsAccount.new(1, 1000)}

    it "checks the method returns the interest that was calculated" do
      expect(savings_account.add_interest(0.25)).to eq 2.5
    end

    it "checks that interest was added to the balance" do
      expect(savings_account.add_interest(0.25)).to eq 2.5
      expect(savings_account.balance).to eq 1002.5
    end
  end
end
