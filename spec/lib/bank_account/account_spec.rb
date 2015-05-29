require 'bank_account'

describe Bank::Account do
  let(:account) {Bank::Account.new("checkit", 1000)}

  describe "attributes" do
    it "responds to :balance" do
      expect(account).to respond_to :balance
    end

    it "responds to :id" do
      expect(account).to respond_to :id
    end

    it "has the id 'checkit'" do
      expect(account.id).to eq("checkit")
    end

    it "has an initial balance of 1000" do
      expect(account.balance).to eq(1000)
    end

    it "returns 750 for a 250 withdrawal" do
      expect(account.withdraw(250)).to eq(750)
    end

    context "negative balance errors" do
      it "raises 'Invalid initial balance' for negative initial balance" do
        expect{Bank::Account.new("so_broke", -10)}.to raise_error(ArgumentError)
      end

      it "returns original balance of 1000 for overdraft" do
        expect(account.withdraw(1500)).to eq(1000)
      end
    end

  end

end
