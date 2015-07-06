require 'spec_helper.rb'


describe BankAccount::SavingsAccount do

  context "#init" do

    it "knows about SavingsAccount class" do
      expect(BankAccount::SavingsAccount).to respond_to :new
    end

    it "doesn't initialize a savings account with < $10" do
      expect{(BankAccount::SavingsAccount.new(3, 5))}.to raise_exception(ArgumentError)
    end
  
  end

  context "balance" do

    let(:savings_account) {BankAccount::SavingsAccount.new(4, 150)}

    it "withdraws the correct amount + $2" do
      expect(savings_account.withdraw(50)).to eq 98 
    end

    it "doesn't let the account go below $10" do
      expect(savings_account.withdraw(139)).to eq 150
    end

    it "inherants deposit functionality from account class" do
      expect(savings_account.deposit(40)).to eq 190
    end

    it "calculates interest" do
      expect(savings_account.add_interest(0.25)).to eq 0.375
    end

    it "returns the correct balance" do
      expect(savings_account.balance).to eq 150
    end
  end

end