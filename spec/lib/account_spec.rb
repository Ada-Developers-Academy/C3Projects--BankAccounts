describe BankAccount::Account do

  describe '.new(id, initial_balance)' do
    it 'responds' do
      expect(BankAccount::Account).to respond_to :new
    end

    context 'when instantiating an accepted account' do
      before :each do
        @my_account = BankAccount::Account.new(1,125)
      end

      it 'creates an instance' do
        expect(@my_account).to be_a BankAccount::Account
      end

      it 'instance has an id' do
        expect(@my_account.id).to eq(1)
      end

      it 'instance has a balance' do
        expect(@my_account.balance).to eq(125)
      end
    end

    context 'when a negative account balance is passed in' do
      it 'raises an ArgumentError' do
        expect { BankAccount::Account.new(1, -1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#balance' do
    it 'responds' do
      expect(BankAccount::Account.new(1,125)).to respond_to :balance
    end
  end

  describe '#withdraw(amount)' do
    before :each do
      @my_account = BankAccount::Account.new(1,125)
    end

    it 'responds' do
      expect(@my_account).to respond_to :withdraw
    end

    it 'updates account balance' do
      @my_account.withdraw(100)
      expect(@my_account.balance).to eq(25)
    end

    it 'returns updated account balance' do
      my_account = BankAccount::Account.new(1,125)
      expect(@my_account.withdraw(25)).to eq(100)
    end

    context 'when attempting to overdraw' do
      it 'returns unmodified account balance' do
        expect(@my_account.withdraw(140)).to eq(125)
      end
    end
  end

  describe '#deposit(amount)' do
    before :each do
      @my_account = BankAccount::Account.new(1,125)
    end

    it 'responds' do
      expect(@my_account).to respond_to :deposit
    end

    it 'updates account balance' do
      @my_account.deposit(100)
      expect(@my_account.balance).to eq(225)
    end

    it 'returns updated account balance' do
      my_account = BankAccount::Account.new(1,125)
      expect(@my_account.deposit(25)).to eq(150)
    end
  end

end
