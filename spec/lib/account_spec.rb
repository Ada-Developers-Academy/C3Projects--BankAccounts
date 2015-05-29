require 'spec_helper'

describe BankAccounts::Account do

  describe "class methods" do
    it "responds to 'new'" do
      expect(BankAccounts::Account).to respond_to :new
    end

    let(:account) { BankAccounts::Account.new("Voltron", 1000) }

    it "subtracts withdraw(amount) and returns updated balance" do
      expect(account.withdraw(50)).to eq(950.00)
    end

    context "when withdraw(amount) would result in a negative value of balance" do
    let(:account) { BankAccounts::Account.new("Voltron", 1000) }

      it "returns original balance" do
        expect(account.withdraw(5032)).to eq(1000)
      end

      it "raises a warning" do
        expect { account.withdraw(2000) }.to output("Warning: Insufficient funds! You cannot withdraw 2000. Your account only has 1000.\n").to_stderr
      end

    end

    describe "#deposit(amount)" do
    let(:account) { BankAccounts::Account.new(39482427, 10_000) }
      it "adds deposit(amount) and returns updated balance" do
        expect(account.deposit(2_000)).to eq(12_000)
      end
    end

    describe "raise_exception when initial_balance < 0" do
      it "raises an ArgumentError" do
        expect { BankAccounts::Account.new(898776, -100) }.to raise_exception(ArgumentError)
      end
    end

    describe "raise_exception when initial_balance is nil" do
      it "raises an ArgumentError" do
        expect { BankAccounts::Account.new(898776, nil) }.to raise_exception(ArgumentError)
      end
    end
  end

  describe "attributes" do
    let(:account) { BankAccounts::Account.new("Voltron", 1000) }

    it "has an id" do
      expect(account.id).to eq("Voltron")
    end

    it "has an initial_balance" do
      expect(account.initial_balance).to eq(1000.00)
    end

    it "has a balance that is initially set to the initial_balance amount" do
      expect(account.balance).to eq(account.initial_balance)
    end

  end


end
