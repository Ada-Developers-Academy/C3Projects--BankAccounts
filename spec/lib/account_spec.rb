module BankAccounts
  describe BankAccounts::Account do

    it "responds to #new" do
      expect(Account).to respond_to :new
    end

    it "raises an ArgumentError if initial_balance is negative" do
      expect{ Account.new("Name", -3) }.to raise_error(ArgumentError, "Only positive initial balances allowed")
    end

    let(:account) { BankAccounts::Account.new("Name", 100) }

    describe '#withdraw' do
      it "deducts the given amount from the account balance" do
        account.withdraw (30)
        expect(account.balance).to eq (70)
      end

      it "returns unmodified balance if withdraw would make balance negative" do
        account.withdraw(110)
        expect(account.balance).to eq (100)
      end
    end

    describe '#deposit' do
      it "adds the given amount to the account balance" do
        account.deposit(20)
        expect(account.balance).to eq (120)
      end

    end
    
    describe '#balance' do
      it "returns current balance" do
        expect(account.balance).to eq(100)
      end
    end
  end
end
