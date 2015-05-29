describe Bank::SavingsAccount do
  it "creates a new instance" do
    expect(Bank::Account).to respond_to(:new)
  end

  it "inherits from Bank::Account" do
    expect(Bank::SavingsAccount.superclass).to eq(Bank::Account)
  end

  let(:account) { Bank::SavingsAccount.new("Savings", 100) }

  describe "#new(id, initial_balance)" do
    it "assigns the id instance variable" do
      expect(account.id).to eq("Savings")
    end

    it "assigns the balance instance variable" do
      expect(account.balance).to eq(100)
    end

    it "doesn't allow an initial_balance below $10" do
      expect{Bank::SavingsAccount.new("Savings", -24)}.to raise_error(ArgumentError, "Balance must be a minimum of $10.")
    end
  end

  describe "#withdraw(amount)" do
    it "withdraws amount from the account" do
      expect(account.withdraw(50)).to be < 100
    end

    # as a result of an ATM transaction

    it "also withdraws $2 fee" do
      expect(account.withdraw(50)).to eq(48)
    end

    # balance cannot go below $10
    context "amount is greater than account minimum of $10" do
      it "doesn't withdraw" do
        account.withdraw(100)
        expect(account.balance).to eq(100)
      end

      it "outputs a warning message" do
        expect{account.withdraw(100)}.to output("You cannot withdraw more than the balance minimum of $12.\n").to_stdout
      end

      it "returns the unmodified the balance" do
        expect(account.withdraw(100)).to eq(100)
      end
    end
  end

  describe "#add_interest(rate)" do
    # rate is assumed to be a percentage, e.g. 0.25
    it "calculates and returns interest on balance" do
      expect(account.add_interest(0.25)).to eq(0.25)
    end

    it "adds interest to balance" do
      account.add_interest(0.25)
      expect(account.balance).to eq(100.25)
    end
  end
end
