require 'spec_helper.rb'


describe BankAccount::Account do
  
  context "#self.new" do
    

    it "knows about account class" do
      expect(BankAccount::Account).to respond_to :new
    end

    it "does not initialize an account that is <= 0" do
      expect{(BankAccount::Account.new(1, 0))}.to raise_exception(ArgumentError, "Account cannot be 0 or less")
    end
  end

  context "balance" do
    let(:account) {BankAccount::Account.new(2, 100)}

    it "withdraw the correct amount" do
      expect(account.withdraw(20)).to eq 80
    end

    it "deposit the correct amount" do
      expect(account.deposit(40)).to eq 140
    end

    it "doesn't allow account to go negative" do
      expect(account.withdraw(100)).to eq 100
    end

    it "returns the correct balance amount" do
      expect(account.balance).to eq 100
    end
  end

end