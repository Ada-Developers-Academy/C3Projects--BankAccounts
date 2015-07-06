describe "BankAccounts::CheckingAccount" do
  before :each do
    id = "Carl"
    initial_balance = 50.to_f
    @account = BankAccounts::CheckingAccount.new(id, initial_balance)
  end

  it "can have instances of the CheckingAccount class" do
    expect(@account).to be_an_instance_of(BankAccounts::CheckingAccount)
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
    it "cannot withdraw below -$10" do
      expect(@account.withdraw(61)).to eq(50)
    end

    it "removes funds from the balance and returns adjusted balance" do
      expect(@account.withdraw(35)).to eq(14)
    end

    it "has a withdrawal transaction fee of $1" do
      this_many = 4
      withdrawal = 1.25
      fee = 1.00

      this_many.times do |count|
        actual_balance_adjustment = (count + 1) * (withdrawal + fee)
        current_balance = 50 - actual_balance_adjustment
        expect(@account.withdraw(withdrawal)).to eq(current_balance)
      end

      actual_balance_adjustment = this_many * (withdrawal + fee)
      expect(@account.balance).to eq(50 - actual_balance_adjustment)
    end
  end

  context "has a #checks_used attribute" do
    it "truly" do
      expect(@account).to respond_to :checks_used
    end
  end

  context "has a #withdraw_using_check method" do
    it "truly" do
      expect(@account).to respond_to :withdraw_using_check
    end

    it "applies an additional $2 fee for every check after the third" do
      withdrawal = 1.50
      withdrawal_fee = 1.00
      actual_withdrawal = withdrawal + withdrawal_fee

      this_many = 5 # 3 free & 2 FEE

      excess_transaction_fee = 2.00
      not_excess_transactions = 3

      this_many.times do |count|
        excess_transactions = (count + 1) - not_excess_transactions
        # adjusting w/ ternary b/c cannot have negative excess transactions. n_n
        excess_transactions = excess_transactions >= 0 ? excess_transactions : 0
        actual_excess_fee = excess_transaction_fee * excess_transactions
        actual_balance_adjustment = ((count + 1) * actual_withdrawal) + actual_excess_fee
        current_balance = 50 - actual_balance_adjustment

        expect(@account.withdraw_using_check(withdrawal)).to eq(current_balance)
      end

      excess_transactions = this_many - not_excess_transactions
      excess_fee = excess_transaction_fee * excess_transactions
      actual_balance_reduction = (this_many * actual_withdrawal) + excess_fee

      expect(@account.balance).to eq(50 - actual_balance_reduction)
    end

    it "does not accept non-numeric input" do
      expect{ @account.withdraw_using_check("two cents") }.to raise_error(ArgumentError)
      expect{ @account.withdraw_using_check("0.02") }.to raise_error(ArgumentError)
      expect{ @account.withdraw_using_check("puppies") }.to raise_error(ArgumentError)
      expect{ @account.withdraw_using_check([0.02]) }.to raise_error(ArgumentError)
      expect{ @account.withdraw_using_check({ check_no: 2076, check_amount: 2.56 }) }.to raise_error(ArgumentError)
    end
  end

  context "has a #reset_checks method" do
    it "truly" do
      expect(@account).to respond_to :reset_checks
    end

    it "resets the number of checks used to zero" do
      this_many = 4
      withdrawal = 1.25

      this_many.times do
        @account.withdraw_using_check(withdrawal)
      end

      expect(@account.checks_used).to eq(this_many)

      @account.reset_checks

      expect(@account.checks_used).to eq(0)
    end
  end
end
