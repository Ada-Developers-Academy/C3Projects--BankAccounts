require 'bank'

describe Bank::Account do

  let(:bank) { Bank::Account.new("Checking", 50) }

  describe "#new" do
    describe "initialize" do
      it "assigns the id instance variable" do
        expect(bank.id).to eq("Checking")
      end

      it "assigns the balance instance variable" do
        expect(bank.balance).to eq(50)
      end

      it "sets balance to an integer" do
        bank = Bank::Account.new("Checking", "45")
        expect(bank.balance).to eq(45)
      end

      it "doesn't initialize a non-integer balance" do
        bank = Bank::Account.new("Checking", "af")
        expect(bank.balance).to eq(0)
      end

      context "when creating an account with a negative balance" do
        it "raises an error" do
          expect{Bank::Account.new("Checking", -10)}.to raise_error(ArgumentError, "Negative balance is invalid.")
        end
      end
    end
  end

  describe "#withdraw(amount)" do

    it "removes amount from the account" do
      [45, 25, 10, 0.10].each do |money|
        bank = Bank::Account.new("Checking", "1000")
        bank.withdraw(money)

        expect(bank.balance).to eq(1000 - money.to_i)
      end
    end

    it "subtracts an integer from @balance" do
      bank = Bank::Account.new("Checking", "45")
      bank.withdraw("20")

      expect(bank.balance).to eq(25)
    end

    it "doesn't subtract a non-integer from @balance" do
      expect{ bank.withdraw("forty") }.to raise_error(ArgumentError, "Not a valid amount.")
    end

    context "amount is greater than account balance" do
      it "does not withdraw amount" do
        bank.withdraw(100)
        expect(bank.balance).to eq(50)
      end

      it "outputs a warning message" do
        # `puts` got changed to `warn` so output doesn't work anymore
        expect{bank.withdraw(100)}.to output("You cannot withdraw more than the balance minimum of $0.\n").to_stdout
      end

      it "returns unmodified balance" do
        unmodified_balance = bank.balance
        expect(bank.withdraw(100)).to eq(unmodified_balance)
      end
    end
  end

  describe "#deposit(amount)" do
    let(:money) { ["22", "50", "60"].sample }

    it "adds amount to @balance" do
      bank.deposit(money)
      expect(bank.balance).to eq(50 + money.to_i)
    end

    it "returns updated balance" do
      expect(bank.deposit(money)).to eq(50 + money.to_i)
    end

    context "adding invalid amounts to balance" do
      it "only adds integers" do
        ["af", "$$", "5&3"].each do |fake_money|
          expect{ bank.deposit(fake_money) }.to raise_error(ArgumentError, "Not a valid amount.")
        end
      end
    end
  end

  describe "#balance" do
    it "returns current balance" do
      bank.deposit(50)
      expect(bank.balance).to eq(50 + 50)
    end
  end
end
