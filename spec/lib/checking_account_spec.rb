module BankAccounts
  describe BankAccounts::CheckingAccount do

    let(:checking_account) { BankAccounts::CheckingAccount.new("Name", 100) }

    it "responds to #new" do
      expect(CheckingAccount).to respond_to :new
    end

    it "responds to #id" do
      expect(checking_account.id).to eq("Name")
    end

    describe '#withdraw' do
      it "deducts the given amount from the account balance" do
        checking_account.withdraw(20)
        expect(checking_account.balance).to eq(79)
      end

      it "returns unmodified balance if withdraw would make balance negative" do
        checking_account.withdraw(110)
        expect(checking_account.balance).to eq(100)
      end
    end

    describe '#withdraw_using_check' do
      it "deducts the given amount using a check from the account balance" do
        checking_account.withdraw_using_check(20)
        expect(checking_account.balance).to eq(80)
      end

      it "returns unmodified balance if withdraw using a check would make account overdrawn by more than $-10" do
        checking_account.withdraw_using_check(115)
        expect(checking_account.balance).to eq(100)
      end

      it "deducts the given amount using a check if withdraw would make account overdrawn by less than $-10" do
        checking_account.withdraw_using_check(105)
        expect(checking_account.balance).to eq(-5)
      end

      #The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
      it "deducts a transaction fee after max number of free checks are used" do
        4.times do
          account.withdraw_using_check(10)
        end
        expect(acccount.balance).to eq(58)
      end
    end
  end
end
