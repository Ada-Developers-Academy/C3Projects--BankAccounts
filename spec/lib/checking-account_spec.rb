require 'spec_helper'

describe BankAccounts::CheckingAccount do
  describe "class methods" do
    it "responds to 'new'" do
      expect(BankAccounts::CheckingAccount).to respond_to :new
    end

    describe "inherits methods from Account class" do
      let(:checking_account) do
        BankAccounts::CheckingAccount.new("Lindsay", 10_000)
      end

      it "adds deposit(amount) and returns updated balance" do
        expect(checking_account.deposit(1_010)).to eq(11_010)
      end

      describe "raise_exception when initial_balance is nil" do
        it "raises an ArgumentError" do
          expect { BankAccounts::CheckingAccount.new(898776, nil) }.to raise_exception(ArgumentError)
        end
      end
    end

    context "when withdraw(amount) would result in a negative value of balance" do
      let(:checking_account) do
        BankAccounts::CheckingAccount.new("Voltron2", 1002)
      end

      it "returns original balance" do
        expect(checking_account.withdraw(5032)).to eq(1002)
      end

      it "allows withdrawals betwee 0 and 10" do
        expect(checking_account.withdraw(1000)).to eq(1)
      end

      it "raises a warning" do
        expect { checking_account.withdraw(2000) }.to output("Warning: This transaction will incur a $1 fee.\nWarning: Insufficient funds! You cannot withdraw 2000. Your account only has 1002.\n").to_stderr
      end

    end

  end

  describe "unique responses to inherited methods" do
    let(:checking_account) { BankAccounts::CheckingAccount.new("Michael", 500) }
    describe "transaction fee incurred for each withdrawal" do
      it "subtracts withdraw(amount) plus $1 fee and returns updated balance" do
        expect(checking_account.withdraw(10)).to eq(489.00)
      end
    end

  end

  describe "unique methods" do
    let(:checking_account) do
      BankAccounts::CheckingAccount.new("Tobias", 87)
    end

    it "responds to 'withdraw_using_check'" do
      expect(checking_account).to respond_to :withdraw_using_check
    end

    it "subtracts amount from balance" do
      expect(checking_account.withdraw_using_check(7)).to eq(80)
    end

    it "allows overdraft up to -10" do
      expect(checking_account.withdraw_using_check(89)).to eq(-2)
    end

    it "does not allow overdraft beyond -10" do
      expect(checking_account.withdraw_using_check(100)).to eq(87)
    end

    it "responds to 'reset_checks'" do
      expect(checking_account).to respond_to :reset_checks
    end

    context "after the third withdraw_using_check call"
      it "charges a $2 fee" do
        expect(checking_account.withdraw_using_check(7)).to eq(80)
        expect(checking_account.withdraw_using_check(2)).to eq(78)
        expect(checking_account.withdraw_using_check(7)).to eq(71)
        expect(checking_account.withdraw_using_check(10)).to eq(59)
        expect(checking_account.withdraw_using_check(7)).to eq(50)
      end
      it "reset_checks sets checks_used to 0" do
        expect(checking_account.reset_checks).to eq(0)

      end
    end




end
