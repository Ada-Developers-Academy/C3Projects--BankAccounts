describe "BankAccounts::Account" do
  before :each do
    id = "Carl"
    initial_balance = 50.to_f
    @account = BankAccounts::Account.new(id, initial_balance)
  end


  it "can have instances of the Account class" do
    expect(@account).to be_an_instance_of(BankAccounts::Account)
  end

  it "has an initial balance" do
    expect(@account.balance).to eq(50)
  end

  it "has a balance in dollars and cents" do
    expect(@account.balance.class).to eq(Float)

    @account.deposit(0.011)
    expect(@account.balance).to eq(@account.balance.round(2))
  end

  it "cannot have a negative initial balance" do
    expect{ BankAccounts::Account.new("George", -1) }.to raise_error(ArgumentError)
  end

  context "has a #deposit method" do
    it "truly" do
      expect(@account).to respond_to :deposit
    end

    it "adds funds to the balance and returns adjusted balance" do
      expect(@account.deposit(45)).to eq(95)
      expect(@account.balance).to eq(95)
    end

    it "cannot deposit negative or zero funds" do
      expect(@account.deposit(-1)).to eq(50)
      expect(@account.balance).to eq(50)

      expect(@account.deposit(0)).to eq(50)
      expect(@account.balance).to eq(50)
    end

    it "only accepts numeric deposits" do
      expect{ @account.deposit("kittens") }.to raise_error(ArgumentError)
      expect{ @account.deposit("65") }.to raise_error(ArgumentError)
      expect{ @account.deposit([65, 12.75, 80]) }.to raise_error(ArgumentError)
      expect{ @account.deposit({deposit: 19.99}) }.to raise_error(ArgumentError)
    end
  end

  context "has a #withdraw method" do
    it "truly" do
      expect(@account).to respond_to :withdraw
    end

    it "removes funds from the balance and returns adjusted balance" do
      expect(@account.withdraw(45)).to eq(5)
      expect(@account.balance).to eq(5)
    end

    it "cannot withdraw into the negative" do
      expect(@account.withdraw(51)).to eq(50)
      expect(@account.balance).to eq(50)
    end

    it "cannot withdraw negative or zero funds" do
      expect(@account.withdraw(-1)).to eq(50)
      expect(@account.balance).to eq(50)

      expect(@account.withdraw(0)).to eq(50)
      expect(@account.balance).to eq(50)
    end

    it "only accepts numeric withdrawals" do
      expect{ @account.withdraw("puppies") }.to raise_error(ArgumentError)
      expect{ @account.withdraw("45") }.to raise_error(ArgumentError)
      expect{ @account.withdraw([45, 6.75, 38]) }.to raise_error(ArgumentError)
      expect{ @account.withdraw({withdrawal: 43.99}) }.to raise_error(ArgumentError)
    end
  end
end
