require './spec/spec_helper'
require './lib/bank_accounts/checking_account'

describe BankAccounts::CheckingAccount do


  describe "class methods" do

    context "when balance would be negative" do
      it "throws an error and aborts savings account creation" do
        expect { BankAccounts::CheckingAccount.new(1, -1) }.to raise_error(ArgumentError, "Checking account can't have a negative balance. Create a new account.")
      end
    end

  end # class methods


  describe "attributes" do
    let(:checking_account) { BankAccounts::CheckingAccount.new(1, 2) }

    it "has initial balance" do
      expect(checking_account.balance).to eq(2)
    end

    it "has id" do
      expect(checking_account.id).to eq(1)
    end

    it "has blank checks" do
      expect(checking_account.checks_used).to eq(0)
    end
  end # attributes


  describe "instance methods" do
    let(:checking_account) { BankAccounts::CheckingAccount.new(1, 20) }

    it "deposits money" do
          expect(checking_account.deposit(8)).to eq(28)
      end

    it "won't accept negative deposits" do
      expect(checking_account.deposit(-10)).to eq(30)
    end

    it "withdraws money with fee" do
      expect(checking_account.withdraw(19)).to eq(0)
    end

    it "won't accept negative withdrawls with fee" do
      expect(checking_account.withdraw(-19)).to eq(0)
    end

    it "won't withdraw too much money with fee" do
      expect(checking_account.withdraw(20)).to eq(20)
    end

    it "withdraws money with checks" do
      expect(checking_account.withdraw_using_check(30)).to eq(-10)
    end

    it "won't withdraw too much money with checks" do
      expect(checking_account.withdraw_using_check(31)).to eq(20)
    end


    context "when doing many check withdrawls" do
      let(:checks_used) {0}
      before(:each) do
				checking_account.withdraw_using_check(2)
			end

      it "counts check usage" do
        expect(checking_account.checks_used).to eq(1)
      end


      context "when on 3rd check withdrawl" do
        before(:each) do
  				2.times do
  					checking_account.withdraw_using_check(2)
  				end
				end

        it "is on 3rd check used" do
          expect(checking_account.checks_used).to eq(3)
        end

        it "still doesn't have a transaction fee" do
          expect(checking_account.balance).to eq(14)
        end


        context "after using all 3 free checks" do
          before(:each) do
            checking_account.withdraw_using_check(2)
          end

          it "is on 4rd check used" do
            expect(checking_account.checks_used).to eq(4)
          end

          it "adds transaction fee to check withdrawls" do
            expect(checking_account.balance).to eq(10)
          end

          context "end of month" do
            before(:each) do
              checking_account.reset_checks
            end

            it "resets checks used to 0" do
              expect(checking_account.checks_used).to eq(0)
            end

          end # context end of month
        end # context 4th check withdrawl
      end # context 3rd check withdrawls
    end # context many check withdralws


  end # instance methods


end # class CheckingAccount
