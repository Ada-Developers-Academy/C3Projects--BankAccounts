describe Bank::MoneyMarketAccount do
  it "creates a new instance" do
    expect(Bank::MoneyMarketAccount).to respond_to(:new)
  end

  it "inherits from Bank::Account" do
    expect(Bank::MoneyMarketAccount.superclass).to eq(Bank::Account)
  end

  it "counts number of transactions" do
    account = Bank::MoneyMarketAccount.new("Market", 10_000)
    account.withdraw(500)
    account.deposit(200)
    expect(account.num_of_transactions).to eq(2)
  end

  # max of 6 transactions allowed per month
  context "when 6 transactions have been made this month" do
    let(:market_account) { Bank::MoneyMarketAccount.new("Market", 10_000) }

    before(:each) do
      3.times do
        market_account.withdraw(20)
        # market_account.balance = 940
      end

      3.times do
        market_account.deposit(10)
        # market_account.balance = 970
      end
    end

    it "denies further transactions" do
      expect{market_account.withdraw(20)}.to raise_error SystemExit
    end
  end

  describe "#new(id, initial_balance)" do
    context "when initial_balance is set below $10,000" do
      # how can I make a spec check that it didn't make an instance
      # that isn't validating that an error was raised (like below)

      it "raises an error" do
        expect{Bank::MoneyMarketAccount.new("Market", 500)}.to raise_error(ArgumentError, "Account requires minimum balance of $10,000.")
      end
    end
  end
end
