# # describe BankAccount::Account do
# # 	# alternate method: 
# # 	# it "creates BankAccount::Account.new." do
# # 	# 	BankAccount::Account.new(0,0)
# # 	# 	expect(BankAccount::Account).to respond_to(:new).with(2).arguments
# # 	# end 
# 	context "Creates Account" do
# 		let (:new_account) {BankAccount::Account.new(1,555)}
# 		let (:negative_account) {BankAccount::Account.new(1,-35)}
	
	
# 		it "tests method on initialize account id" do
# 			expect(new_account.id).to eq(1)
# 		end

# 		it "tests method on initialize account balance" do
# 			expect(new_account.initial_balance).to eq(555)
# 		end

# 		it "raises an error if you try to start the account with a negative balance" do
# 			expect{negative_account}.to raise_error(ArgumentError) 
# 		end

# 		it "withdraws money from account." do
# 			expect(new_account.withdraw(1)).to eq(554)
# 		end

# 		it "raises an error if attempt to overdraw acct."do
# 			expect{new_account.withdraw(1000)}.to raise_error(ArgumentError)
# 		end

# 		it "adds money to the account" do
# 			expect(new_account.deposit(100)).to eq(655)
# 		end

# 		it "displays current balance" do
# 			expect(new_account.balance).to eq(555)
# 		end
# 	end #context ::Account end	
# end #describe::Account end

describe BankAccount::Saving do
	context "creates Saving < Account"
	
		let (:new_account) {BankAccount::Saving.new(5,1000)}
		let (:negative_account) {BankAccount::Saving.new(5,8)}
		let (:penalty_account){BankAccount::Saving.new(5,23)}

		it "tests method on initialize account id" do
			expect(new_account.id).to eq(5)
		end
		
		it "tests method on initial_balance" do
			expect(new_account.initial_balance).to eq(1000)
		end

		it "raises an error if trying to start acct w/ less $10" do
			expect{negative_account}.to raise_error(ArgumentError) 
		end

		it "withdraws money + $2 from account" do
			expect(penalty_account.withdraw(5)).to eq(16)
		end

		it "gives a warning message if the account is 10 - 20 dollars." do
      expect(penalty_account.withdraw(10)).to eq(11)
    end

		# it "will not withdraw money from account if balance $10" do 
      #expect(penalty_account.withdraw(20)).to eq(23) 
    # end

		it "throws an error msg if attempt to draw account below $10" do 
      expect{penalty_account.withdraw(20)}.to raise_error(ArgumentError)
    end

		# it "returns current balance after withdraw"
      #return @current_balance 
      #expect(new_account.withdraw(5)).to eq(955)
    #end
		
    # it "calculates interest on current balance" 
      #expect(new_account.add_interest(0.0925)).to eq(92.50)
    #end
		
    # it "adds interest to current balance"
    # expect(new_account.add_interest(0.0925).balance).to eq(1092.50)
    # end
		
	end #context::Saving end
# end #describe::Saving end


