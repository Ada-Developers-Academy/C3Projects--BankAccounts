require './lib/bank_account/account.rb'

describe Bank::Account do
  let(:account) {Bank::Account.new("check_it", 1000)}

  describe "attributes" do
    it "responds to :balance" do
      expect(account).to respond_to :balance
    end

    it "responds to :id" do
      expect(account).to respond_to :id
    end

    it "has the id 'checkit'" do
      expect(account.id).to eq("check_it")
    end

    it "has an initial balance of 1000" do
      expect(account.balance).to eq(1000)
    end

    it "withdraws the specified amount" do
      expect(account.withdraw(250)).to eq(750)
    end

    context "negative balance errors" do
      it "raises 'Invalid initial balance' for negative initial balance" do
        expect{Bank::Account.new("so_broke", -10)}.to raise_error(ArgumentError)
      end

      it "returns original balance for overdraft" do
        expect(account.withdraw(1500)).to eq(1000)
      end
    end

  end

end
