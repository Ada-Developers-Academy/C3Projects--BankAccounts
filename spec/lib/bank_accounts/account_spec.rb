describe BankAccount::Account do
#   # alternate method: 
#   # it "creates BankAccount::Account.new." do
#   #   BankAccount::Account.new(0,0)
#   #   expect(BankAccount::Account).to respond_to(:new).with(2).arguments
#   # end 
  context "Creates Account" do
    let (:new_account) {BankAccount::Account.new(1,555)}
    let (:negative_account) {BankAccount::Account.new(1,-35)}
  
  
    it "tests method on initialize account id" do
      expect(new_account.id).to eq(1)
    end

    it "tests method on initialize account balance" do
      expect(new_account.initial_balance).to eq(555)
    end

    it "raises an error if you try to start the account with a negative balance" do
      expect{negative_account}.to raise_error(ArgumentError) 
    end

    it "withdraws money from account." do
      expect(new_account.withdraw(1)).to eq(554)
    end

    it "raises an error if attempt to overdraw acct."do
      expect{new_account.withdraw(1000)}.to raise_error(ArgumentError)
    end

    it "adds money to the account" do
      expect(new_account.deposit(100)).to eq(655)
    end

    it "displays current balance" do
      expect(new_account.balance).to eq(555)
    end
  end #context ::Account end  
end #describe::Account end