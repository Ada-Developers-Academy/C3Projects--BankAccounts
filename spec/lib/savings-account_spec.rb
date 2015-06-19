require 'spec_helper'

describe BankAccounts::SavingsAccount do
  describe "Class methods:" do
    describe "inherits methods from Account class" do
      let(:savings_account) do
        BankAccounts::SavingsAccount.new("Buster", 50)
      end

      it "adds deposit(amount) and returns updated balance" do
        expect(savings_account.deposit(2_000)).to eq(2_050)
      end

      context "when initial_balance argument < 0" do
        it "raises an ArgumentError" do
          expect { BankAccounts::SavingsAccount.new(898776, -100) }.to raise_exception(ArgumentError)
        end
      end

      context "when initial_balance argument is nil" do
        it "raises an ArgumentError" do
          expect { BankAccounts::SavingsAccount.new(898776, nil) }.to raise_exception(ArgumentError)
        end
      end
    end

    describe "unique responses to inherited methods" do
      describe "raise_exception when initial_balance is < 10 and > 0" do
        it "raises an ArgumentError" do
          expect { BankAccounts::SavingsAccount.new(898776, 5) }.to raise_exception(ArgumentError)
        end
      end

      let(:savings_account) do
        BankAccounts::SavingsAccount.new("George Michael", 50)
      end

      describe "transaction fee incurred for each withdrawal" do
        it "subtracts withdraw(amount) plus $2 fee and returns updated balance" do
          expect(savings_account.withdraw(5)).to eq(43.00)
        end
      end

      context "when withdraw(amount) would result in a balance of < 10" do
        let(:savings_account) do
          BankAccounts::SavingsAccount.new("Gangy", 1_000_000)
        end

        it "returns balance" do
          expect(savings_account.balance).to eq(1_000_000)
        end

        it "returns original balance" do
          expect(savings_account.withdraw(999_989)).to eq(1_000_000)
        end

        it "raises a warning" do
          expect { savings_account.withdraw(2_000_000) }.to output("Warning: This transaction will incur a $2 fee.\nWarning: Insufficient funds! You cannot withdraw 2000000. Your account only has 1000000.\n").to_stderr
        end

      end
    end

    describe "unique method - #add_interest(rate)" do
      let(:savings_account) do
        BankAccounts::SavingsAccount.new("Gob", 10_000)
      end

      it "calculates and returns interest amount" do
        expect(savings_account.add_interest(0.25)).to eq(25)
      end

      it "updates account balance to include interest" do
        savings_account.add_interest(0.25)
        expect(savings_account.balance).to eq(10_025)
      end

    end

  end

  describe "attributes" do
    let(:savings_account) do
      BankAccounts::SavingsAccount.new("Zuckercorn", 500)
    end

    describe "inherits attributes from Account class" do

      it "has an id" do
        expect(savings_account.id).to eq("Zuckercorn")
      end

      it "has an initial_balance" do
        expect(savings_account.initial_balance).to eq(500.00)
      end

      it "has a balance that is initially set to the initial_balance amount" do
        expect(savings_account.balance).to eq(savings_account.initial_balance)
      end
    end
  end
end
