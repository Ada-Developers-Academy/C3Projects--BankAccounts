module BankAccounts
  describe BankAccounts::SavingsAccount do

    it "responds to #new" do
      expect(SavingsAccount).to respond_to :new
    end

    it "raises an ArgumentError if initial_balance is less than 10" do
      expect{ SavingsAccount.new("Name", 5) }.to raise_error(ArgumentError, "Initial balances must be at least 10")
    end

    let(:savings_account) { BankAccounts::SavingsAccount.new("Name", 100) }

    it "responds to #id" do
      expect(savings_account.id).to eq("Name")
    end

    describe '#deposit' do
      it "adds the given amount to the account balance" do
        savings_account.deposit(20)
        expect(savings_account.balance).to eq(120)
      end
    end

    describe '#withdraw' do
      it "deducts the given amount from the account balance" do
        savings_account.withdraw(20)
        expect(savings_account.balance).to eq(78)
      end

      it "returns unmodified balance when withdraw amount would result in a balance less than the minimum allowed balance" do
        savings_account.withdraw(95)
        expect(savings_account.balance).to eq(100)
      end
    end

    describe '#add_interest' do
      it "returns interest amount" do
        my_savings = SavingsAccount.new("Name", 10_000)
        expect(my_savings.add_interest(0.25)).to eq(25)
      end

      it "returns balance after adding interest" do
        my_savings = SavingsAccount.new("Name", 10_000)
        my_savings.add_interest(0.25)
        expect(my_savings.balance).to eq(10_025)
      end
    end
  end
end
