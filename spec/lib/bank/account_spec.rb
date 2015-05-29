require 'bank'

describe Bank::Account do

  before :each do
    @bank = Bank::Account.new("Checking", 50)
  end

  describe "#new" do
    it "creates a new instance" do
      expect(Bank::Account).to respond_to(:new)
    end

    describe "initialize" do
      it "assigns the id instance variable" do
        expect(@bank.id).to eq("Checking")
      end

      it "assigns the balance instance variable" do
        expect(@bank.balance).to eq(50)
      end

      it "cannot be initialized with a negative balance" do
        bank = Bank::Account.new("Checking", -10)
        expect(bank.balance).to eq(0)
      end

      it "sets balance to an integer" do
        bank = Bank::Account.new("Checking", "45")
        expect(bank.balance).to eq(45)

        bank2 = Bank::Account.new("Checking", "af")
        expect(bank2.balance).to eq(0)
      end
    end
  end

  describe "#withdraw(amount)" do
    money = [45, 25, 10, 0.10].shuffle.sample

    it "removes $#{money} from the account" do
      bank = Bank::Account.new("Checking", "1000")
      bank.withdraw(money)

      expect(bank.balance).to eq(1000 - money)
    end

    # it "is a result of an ATM transaction" do
    # end

    it "subtracts an integer from @balance" do
      bank = Bank::Account.new("Checking", "45")
      bank.withdraw("20")
      expect(bank.balance).to eq(25)

      bank2 = Bank::Account.new("Checking", 100)
      bank.withdraw("forty")
      expect(bank2.balance).to eq(100)
    end

    it "does not allow account to go negative" do
      @bank.withdraw(100)
      expect(@bank.balance).to eq(0)
    end
  end
end
