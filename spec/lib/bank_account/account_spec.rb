require 'spec_helper'

describe BankAccount::Account do
  it "responds to the .new class method" do
    expect(BankAccount::Account).to respond_to :new
  end
end
