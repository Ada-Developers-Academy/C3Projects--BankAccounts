describe "BankAccounts::MoneyMarketAccount" do
  before :each do
    id = "Carl"
    initial_balance = 10_000.to_f
    @account = BankAccounts::MoneyMarketAccount.new(id, initial_balance)
  end

  it "can have instances of the MoneyMarketAccount class" do
    expect(@account).to be_an_instance_of(BankAccounts::MoneyMarketAccount)
  end

  context "inherits from Account class" do
    it "has a balance in dollars and cents" do
      expect(@account.balance.class).to eq(Float)

      @account.deposit(0.011111111)
      expect(@account.balance).to eq(@account.balance.round(2))
    end

    it "has a #deposit method" do
      expect(@account).to respond_to :deposit
    end
  end

  context "has updated versions of some methods from Account class" do
    it "updates transactions count on #deposit & #withdraw" do
      expect(@account.transactions).to eq(0)

      @account.deposit(1)
      expect(@account.transactions).to eq(1)

      @account.withdraw(1)
      expect(@account.transactions).to eq(2)
    end

    context "minimum balance side effects" do
      before :each do
        @account.withdraw(5) # balance after withdrawal: 9_995, balance after low balance fee: 9_895
      end

      it "cannot withdraw below $10_000 more than once in succession" do
        expect{ @account.withdraw(5) }.to raise_error(ArgumentError)
      end

      it "applies a $100 fee for withdrawals that result in low balances (below $10_000)" do
        expect(@account.balance).to eq(9_895)
      end

      it "does not permit additional withdrawals until balance is back above minimum ($10_000)" do
        expect{ @account.withdraw(5) }.to raise_error(ArgumentError)

        @account.deposit(5)

        expect{ @account.withdraw(5) }.to raise_error(ArgumentError)

        @account.deposit(100)

        expect(@account.withdraw(5)).to eq(true)
      end
    end
  end

  context "has a transaction limit" do
    it "truly" do
      expect(BankAccounts::MoneyMarketAccount::TRANSACTION_LIMIT).not_to eq(nil)
    end

    it "keeps track of transactions" do
      expect(@account).to respond_to :transactions
      expect(@account.transactions).to eq(0)

      @account.deposit(1)
      expect(@account.transactions).to eq(1)

      @account.deposit(1)
      expect(@account.transactions).to eq(2)
    end

    it "does not allow transactions in excess of the limit" do
      this_many = 3

      this_many.times do
        @account.deposit(1)
        @account.withdraw(1)
      end

      expect{ @account.deposit(1) }.to raise_error(ArgumentError)
      expect{ @account.deposit(0) }.to raise_error(ArgumentError)
    end

    it "does not count deposit transactions that are correcting dips below minimum balance" do
      @account.withdraw(5_000)
      expect(@account.balance).to eq(4_900)

      51.times do
        @account.deposit(100)
      end

      expect(@account.transactions).to eq(1)
    end

    it "can reset transaction count" do
      this_many = 5

      this_many.times do
        @account.deposit(1)
      end

      expect(@account.transactions).to eq(this_many)

      @account.reset_transactions
      expect(@account.transactions).to eq(0)
    end
  end

  context "has an #add_interest method" do
    it "truly" do
      expect(@account).to respond_to :add_interest
    end

    it "updates the balance when called" do
      rate = 0.25 # percent

      @account.add_interest(rate)

      expect(@account.balance).to eq(10_025)
    end

    it "returns the interest that was accumulated" do
      rate = 0.25 # 0.25%

      expect(@account.add_interest(rate)).to eq(25)
    end

    it "does not accept non-numeric input" do
      expect{ @account.add_interest("two percent") }.to raise_error(ArgumentError)
      expect{ @account.add_interest("2%") }.to raise_error(ArgumentError)
      expect{ @account.add_interest("kittens") }.to raise_error(ArgumentError)
      expect{ @account.add_interest([0.02]) }.to raise_error(ArgumentError)
      expect{ @account.add_interest({ rate_percent: 2.0, rate_decimal: 0.02, rate_text: "two percent" }) }.to raise_error(ArgumentError)
    end
  end
end
