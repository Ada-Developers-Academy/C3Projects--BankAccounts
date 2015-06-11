require './lib/bank_account/savings_account'
require 'spec_helper.rb'

# to make my puts statements not show up in the rspec tests
# found at http://stackoverflow.com/questions/15430551/suppress-console-output-during-rspec-tests
RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    # Redirect stderr and stdout
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end

describe BankAccount::SavingsAccount do
  let (:new_account200) {BankAccount::SavingsAccount.new(100, 200)}

  it "responds to class method called new" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end

  it "expects initial Savings Account balance to equal current balance" do
    expect(new_account200.balance).to eq (200)
  end

  it "creates Savings Account & passes parameters correctly" do
    expect(new_account200).to be_a(BankAccount::SavingsAccount) #initializer that i ran is actually working/instance of BankAccount
    expect(new_account200.id).to eq(100)
    expect(new_account200.balance).to eq(200)
  end

  it "raises ArgumentError for an initial balance below 10"  do
    expect {
      BankAccount::SavingsAccount.new(100,9)
    }.to raise_exception("You can't start out with a balance below $10. Add moar monies.")
  end

  it "withdraws correctly with transaction fee" do
    expect(new_account200.withdraw(8)).to eq(190)
  end

  it "returns unchanged balance if withdrawal causes it to go below $10" do
    expect(new_account200.withdraw(220)).to eq(200)
  end

  it "deposits correctly by inheriting method from base class" do
    expect(new_account200.deposit(20)).to eq(220)
  end

  it "keeps track of the current balance after each withdrawal or deposit" do
    expect(new_account200.withdraw(98)).to eq(100)
    expect(new_account200.deposit(50)).to eq(150)
  end

  it "returns the balance correctly when called" do
    expect(new_account200.deposit(50)).to eq(250)
    expect(new_account200.balance).to eq(250)
  end

  it "returns the interest & returns the new balance when calling balance" do
    expect(new_account200.add_interest(10)).to eq(20)
    expect(new_account200.balance).to eq(220)
  end

end
