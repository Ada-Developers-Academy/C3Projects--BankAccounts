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

		it "returns 4498 if you withdraw 500 and it has a 2 transaction fee" do
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

		describe "you can accrue interest on your account balance" do
			context "add_interest returns the amount of interest you have earned"do
				it "returns 12.5 when you call add_interest method at a 0.25 interest rate" do
					expect(savings_account.add_interest(0.25)).to eq 12.50
				end
			end

			context "adds the interest that's calculated to the account balance" do
				it "returns 5012.50 when you add interest at a 0.25 rate" do
					savings_account.add_interest(0.25)
					expect(savings_account.account_balance).to eq 5012.50
				end

				context "it rounds interest and account_balance to two decimal places" do
					it "returns 5016.94 when you add interest at a 0.338739340 rate" do
						savings_account.add_interest(0.338739340)
						expect(savings_account.account_balance).to eq 5016.94
					end
				end
			end
		end

	end # describe instance

end #describe class