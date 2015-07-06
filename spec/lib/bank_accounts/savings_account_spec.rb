describe "BankAccounts::SavingsAccount" do
  before :each do
    id = "Carl"
    initial_balance = 50.to_f
    @account = BankAccounts::SavingsAccount.new(id, initial_balance)
  end

  it "can have instances of the SavingsAccount class" do
    expect(@account).to be_an_instance_of(BankAccounts::SavingsAccount)
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
    it "must have a minimum opening balance of $10" do
      expect{ BankAccounts::SavingsAccount.new("Bad George", 9) }.to raise_error(ArgumentError)

      good_george = BankAccounts::SavingsAccount.new("Good George", 10)
      expect(good_george).to be_an_instance_of(BankAccounts::SavingsAccount)
      expect(good_george.balance).to eq(10)
    end

    it "cannot withdraw below $10" do
      expect(@account.withdraw(41)).to eq(50)
    end

    it "removes funds from the balance and then returns true" do
      expect(@account.withdraw(35)).to eq(13)
    end

    it "has a withdrawal transaction fee of $2" do
      this_many = 4
      withdrawal = 1.25
      fee = 2.00

      this_many.times do |count|
        actual_balance_adjustment = (count + 1) * (withdrawal + fee)
        current_balance = 50 - actual_balance_adjustment
        expect(@account.withdraw(withdrawal)).to eq(current_balance)
      end

      actual_balance_adjustment = this_many * (withdrawal + fee)

      expect(@account.balance).to eq(50 - actual_balance_adjustment)
    end
  end

  context "has an #add_interest method" do
    it "truly" do
      expect(@account).to respond_to :add_interest
    end

    it "updates the balance when called" do
      rate = 10 # percent

      @account.add_interest(rate)

      expect(@account.balance).to eq(55)
    end

    it "returns the interest that was accumulated" do
      rate = 10 # 10%

      expect(@account.add_interest(rate)).to eq(5)
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
