describe Bank::MoneyMarketAccount do
  it "creates a new instance" do
    expect(Bank::MoneyMarketAccount).to respond_to(:new)
  end

  it "inherits from Bank::Account" do
    expect(Bank::MoneyMarketAccount.superclass).to eq(Bank::Account)
  end

  it "counts number of transactions" do
    account = Bank::MoneyMarketAccount.new("Market", 10_000)
    account.withdraw(500) # 9500
    account.deposit(200) # 9700
    expect(account.num_of_transactions).to eq(1)
    # 1 and not 2 because the balance isn't >= $10k
  end

  let(:account) { Bank::MoneyMarketAccount.new("Market", 20_000) }

  # PER MONTH - make a test for that
  context "when 6 transactions have been made this month" do
    let(:market_account) { Bank::MoneyMarketAccount.new("Market", 20_000) }

    before(:each) do
      3.times do
        market_account.withdraw(70)
        # market_account.balance = 19_790
      end

      3.times do
        market_account.deposit(60)
        # market_account.balance = 19_970
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

  describe "#withdraw(amount)" do
    it "subtracts amount from the balance" do
      account.withdraw(1000)
      expect(account.balance).to eq(19_000)
    end

    it "returns the updated balance" do
      expect(account.withdraw(3000)).to eq(17_000)
    end

    context "when withdrawal causes balance to go below $10,000" do
      it "adds a fee of $100 to balance" do
        account.withdraw(10_500)
        expect(account.balance).to eq(9400) # 9500 - 100
      end

      it "denies withdrawals until balance is increased" do
        account.withdraw(10_500)
        expect(account.withdraw(5000)).to eq(9400) # balance stays the same
        expect(account.deposit(500)).to eq(9900)
        expect(account.withdraw(500)).to eq(9900) # can't withdraw until balance >= $10k
        expect(account.deposit(1000)).to eq(10_900)
        expect(account.withdraw(100)).to eq(10_800) # successful withdrawal
      end

      it "counts each transaction towards the 6 transaction maximum" do
        3.times do
          account.withdraw(11_000)
          account.deposit(2000)
      end

        # withdraw1 counts; balance = 8900
        # deposit1 doesn't count; balance = 10_900
        # withdraw2 doesn't count, balance would've been negative; stays 10_900
        # deposit2 counts; balance = 12900
        # withdraw3 counts; balance = 1800
        # deposit3 doesn't count; balance = 3800
        expect(account.num_of_transactions).to eq(3)
      end
    end
  end

  describe "#deposit(amount)" do
    it "adds to the balance" do
      account.deposit(10_000)
      expect(account.balance).to eq(30_000)
    end

    it "returns an updated balance" do
      expect(account.deposit(5000)).to eq(25_000)
    end

    it "counts towards total number of transactions" do
      3.times { account.deposit(5000) }
      expect(account.num_of_transactions).to eq(3)
    end

    it "doesn't count deposits that reach/exceed minimum balance" do
      account.withdraw(15_000) # counts, balance = 5000
      3.times { account.deposit(3500) } # balance = 8500; 12_000; counts, 15_500
      expect(account.num_of_transactions).to eq(2)
    end
  end
end
