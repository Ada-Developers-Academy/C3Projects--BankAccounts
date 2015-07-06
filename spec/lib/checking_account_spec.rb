require 'spec_helper.rb'

describe BankAccount::CheckingAccount do 
  
  context "CheckingAccount" do

    it "knows about init from parent class" do
      expect(BankAccount::CheckingAccount).to respond_to :new
    end
  end

  context "withdraw methods methods" do
    let(:checking_account) {BankAccount::CheckingAccount.new(6, 600)}

    it "withdraws correct amount + $1" do
      expect(checking_account.withdraw(375)).to eq 224 
    end

    it "will not let your accout be <= 0" do
      expect(checking_account.withdraw(599)).to eq 600
    end

    it "#withdraw_using_check" do
      expect(checking_account.withdraw_using_check(50)).to eq 550
    end

    it "withdraw_using_check withdraws the fee after using 3 checks" do
      3.times do |count|
        expect(checking_account.checks).to eq count
        checking_account.withdraw_using_check(200)
      end
      expect(checking_account.balance).to eq 0
      checking_account.withdraw_using_check(8)
      expect(checking_account.balance).to eq -10

    end

    context "checks methods" do
      let(:checking_account) {BankAccount::CheckingAccount.new(6, 600)}
      

      it "checks if checks are set" do
        4.times do |count|
          checking_account.withdraw_using_check(10)
        end
        expect(checking_account.checks).to eq 4
      end

      it "reset the check counter" do
        expect(checking_account.reset_checks).to eq 0
      end
  
    end

  end 
end