describe BankAccount::CheckingAccount do

  describe '.new(id, initial_balance)' do
    it 'responds' do
      expect(BankAccount::CheckingAccount).to respond_to :new
    end

    context 'when instantiating an accepted account' do
      before :all do
        @my_account = BankAccount::CheckingAccount.new(1,125)
      end

      it 'is a CheckingAccount instance' do
        expect(@my_account).to be_instance_of BankAccount::CheckingAccount
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

      it 'has an initial_balance' do
        expect(@my_account.initial_balance).to eq(125)
      end
    end

    context 'when a negative account balance is passed in' do
      it 'raises an ArgumentError' do
        expect { BankAccount::CheckingAccount.new(1,-1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'attr_reader' do
    before :all do
      @my_account = BankAccount::CheckingAccount.new(1,125)
    end

    it '#balance responds' do
      expect(@my_account).to respond_to :balance
    end

    it '#initial_balance responds' do
      expect(@my_account).to respond_to :initial_balance
    end

    it '#checks_used responds' do
      expect(@my_account).to respond_to :checks_used
    end

    it '#reset_checks responds' do
      expect(@my_account).to respond_to :reset_checks
    end
  end

  describe '#withdraw(amount)' do
    before :each do
      @my_account = BankAccount::CheckingAccount.new(1,125)
    end

    it 'responds' do
      expect(@my_account).to respond_to :withdraw
    end

    it 'updates account balance (includes $1 transaction fee)' do
      @my_account.withdraw(100)
      expect(@my_account.balance).to eq(24)
    end

    it 'does not affect initial_balance' do
      @my_account.withdraw(100)
      expect(@my_account.initial_balance).to eq(125)
    end

    it 'returns updated account balance (includes $1 transaction fee)' do
      expect(@my_account.withdraw(25)).to eq(99)
    end

    context 'when attempting to overdraw' do
      it 'returns unmodified account balance' do
        expect(@my_account.withdraw(140)).to eq(125)
      end
    end
  end

  describe '#withdraw_using_check(amount)' do
    context 'first three checks have no transaction fee' do
      before :each do
        @my_account = BankAccount::CheckingAccount.new(1,125)
      end

      it 'responds' do
        expect(@my_account).to respond_to :withdraw_using_check
      end

      it 'updates account balance (includes no transaction fee)' do
        @my_account.withdraw_using_check(100)
        expect(@my_account.balance).to eq(25)
      end

      it 'does not affect initial_balance' do
        @my_account.withdraw_using_check(100)
        expect(@my_account.initial_balance).to eq(125)
      end

      it 'returns updated account balance (includes no transaction fee)' do
        expect(@my_account.withdraw_using_check(25)).to eq(100)
      end

      it 'increments check count' do
        @my_account.withdraw_using_check(1)
        expect(@my_account.checks_used).to eq(1)
      end

      it 'still has no transaction fee for third check' do
        @my_account.withdraw_using_check(1)
        @my_account.withdraw_using_check(1)
        expect(@my_account.withdraw_using_check(1)).to eq(122)
      end

      context 'when attempting to overdraw' do
        it 'returns unmodified account balance (>$10 overdraw)' do
          expect(@my_account.withdraw_using_check(140)).to eq(125)
        end

        it 'allows up to $10 overdraw (includes no transaction fee)' do
          expect(@my_account.withdraw_using_check(135)).to eq(-10)
        end
      end
    end

    context '4th check' do
      it 'charges a $2 transaction fee' do
        @my_account = BankAccount::CheckingAccount.new(1,125)
        @my_account.withdraw_using_check(1)
        @my_account.withdraw_using_check(1)
        @my_account.withdraw_using_check(1)
        expect(@my_account.withdraw_using_check(1)).to eq(119)
      end
    end
  end

  describe '#deposit(amount)' do
    before :each do
      @my_account = BankAccount::CheckingAccount.new(1,125)
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

end
