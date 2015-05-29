describe BankAccount::SavingsAccount do

  describe '.new(id, initial_balance)' do
    it 'responds' do
      expect(BankAccount::SavingsAccount).to respond_to :new
    end

    context 'when instantiating an accepted account' do
      before :all do
        @my_account = BankAccount::SavingsAccount.new(1,125)
      end

      it 'is a SavingsAccount instance' do
        expect(@my_account).to be_instance_of BankAccount::SavingsAccount
      end

      it 'is also an Account' do
        expect(@my_account).to be_a BankAccount::Account
      end

      it 'has an id' do
        expect(@my_account.id).to eq(1)
      end

      it 'has a balance' do
        expect(@my_account.balance).to eq(125)
      end

      it 'has an intiial_balance' do
        expect(@my_account.initial_balance).to eq(125)
      end
    end

    context 'when a negative account balance is passed in' do
      it 'raises an ArgumentError' do
        expect { BankAccount::SavingsAccount.new(1,-1) }.to raise_error(ArgumentError)
      end
    end

    context 'when an account balance < $10 is passed in' do
      it 'raises an ArgumentError' do
        expect { BankAccount::SavingsAccount.new(1,5) }.to raise_error(ArgumentError)
      end

      it 'handles floats appropriately' do
        expect { BankAccount::SavingsAccount.new(1,9.99) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#balance' do
    it 'responds' do
      expect(BankAccount::SavingsAccount.new(1,125)).to respond_to :balance
    end
  end

  describe '#initial_balance' do
    it 'responds' do
      expect(BankAccount::SavingsAccount.new(1,125)).to respond_to :initial_balance
    end
  end

  describe '#withdraw(amount)' do
    before :each do
      @my_account = BankAccount::SavingsAccount.new(1,125)
    end

    it 'responds' do
      expect(@my_account).to respond_to :withdraw
    end

    it 'updates account balance (includes transaction fee)' do
      @my_account.withdraw(100)
      expect(@my_account.balance).to eq(23)
    end

    it 'does not affect initial_balance' do
      @my_account.withdraw(100)
      expect(@my_account.initial_balance).to eq(125)
    end

    it 'returns updated account balance (includes transaction fee)' do
      expect(@my_account.withdraw(25)).to eq(98)
    end

    it 'allows balance to go to $10' do
      expect(@my_account.withdraw(113)).to eq(10)
    end

    context 'when attempting to overdraw' do
      it 'returns unmodified account balance' do
        expect(@my_account.withdraw(130)).to eq(125)
      end
    end

    context 'when withdrawal would leave balance < $10' do
      it 'returns unmodified account balance' do
        expect(@my_account.withdraw(115.5)).to eq(125)
      end

      it 'includes transaction fee in calculations' do
        expect(@my_account.withdraw(114)).to eq(125)
      end

      it 'handles floats appropriately' do
        expect(@my_account.withdraw(113.5)).to eq(125)
      end
    end
  end

  describe '#deposit(amount)' do
    before :each do
      @my_account = BankAccount::SavingsAccount.new(1,125)
    end

    it 'responds' do
      expect(@my_account).to respond_to :deposit
    end

    it 'updates account balance' do
      @my_account.deposit(100)
      expect(@my_account.balance).to eq(225)
    end

    it 'returns updated account balance' do
      expect(@my_account.deposit(25)).to eq(150)
    end
  end

  describe '#add_interest(rate)' do
    before :each do
      @my_account = BankAccount::SavingsAccount.new(1,125)
    end

    it 'responds' do
      expect(@my_account).to respond_to :add_interest
    end

    it 'updates account balance' do
      @my_account.add_interest(0.25)
      expect(@my_account.balance).to eq(125.31)
    end

    it 'handles rounding earned interest appropriately (rounds .015 down)' do
      @my_account.add_interest(0.012)
      expect(@my_account.balance).to eq(125.01)
    end

    it 'returns interest accrued, not account balance' do
      expect( @my_account.add_interest(0.25) ).to eq(0.31)
    end

  end
end
