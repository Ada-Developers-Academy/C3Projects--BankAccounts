describe "BankAccounts::Account" do
  it "an instance of Account responds to #balance" do
    expect(BankAccounts::Account.new).to respond_to :balance
  end
end
