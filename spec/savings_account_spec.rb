require "spec_helper"
require "bankaccount"

describe BankAccount::SavingsAccount do

	it "responds to the method new" do
		expect(BankAccount::SavingsAccount).to respond_to :new
	end

	it "is a subclass of Account" do
		expect(BankAccount::SavingsAccount.ancestors).to include(BankAccount::Account)
	end

	context "SavingsAccount must be created with an initial_balance >= 10" do
		it "raises an ArgumentError if you try to create a SavingsAccount with an initial balance < 10" do
			expect{ BankAccount::SavingsAccount.new(1,3) }.to raise_error(ArgumentError)
		end
	end

	describe "a SavingsAccount instance with an initial balance of 5000" do
		let(:savings_account) { BankAccount::SavingsAccount.new(1,5000) }

		it "returns 4498 if you withdraw 500 and it has a $2 transaction fee" do
			expect(savings_account.withdraw(500)).to eq 4498
		end

		it "returns 5500 if you deposit 500" do
			expect(savings_account.deposit(500)).to eq 5500
		end

		context "you can check your account balance" do
			it "returns 3506 if you withdraw 500, deposit 10, and withdraw 1000." do
				savings_account.withdraw(500)
				savings_account.deposit(10)
				savings_account.withdraw(1000)
				expect(savings_account.balance).to eq 3506
			end
		end

		# describe "your SavingsAccount cannot have a balance < 10" do
		# 	it "raises an ArgumentError if you try to withdraw an amount that would make your account balance < 10" do
		# 		expect(savings_account.withdraw(4999)).to raise_error(ArgumentError)
		# 	end
		# end

	end # describe instance

end #describe class