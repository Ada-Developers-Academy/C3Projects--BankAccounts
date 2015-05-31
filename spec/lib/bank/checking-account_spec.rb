describe Bank::CheckingAccount do
  it "creates a new instance" do
    expect(Bank::CheckingAccount).to respond_to(:new)
  end

  it "inherits from Bank::Account" do
    expect(Bank::CheckingAccount.superclass).to eq(Bank::Account)
  end

  let(:account) { Bank::CheckingAccount.new("Checking", 1000) }

  describe "#withdraw(amount)" do
    it "withdraws amount from balance" do
      account.withdraw(100)
      expect(account.balance).to eq(900)
    end

    # from an ATM transaction

    # how can I check for the $1 independently?
    it "also withdraws $1 fee and returns balance" do
      expect(account.withdraw(100)).to eq(899)
    end

    context "amount is greater than account balance" do
      it "doesn't allow the account to go negative" do
        account.withdraw(2000)
        expect(account.balance).to eq(1000)
      end

      it "outputs a warning message" do
        expect{account.withdraw(2000)}.to output("You cannot withdraw more than the balance minimum of $0.\n").to_stdout
      end

      it "returns unmodified balance" do
        expect(account.withdraw(2000)).to eq(1000)
      end
    end
  end
end
