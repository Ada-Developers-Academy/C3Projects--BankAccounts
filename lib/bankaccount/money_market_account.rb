module BankAccount

	class MoneyMarketAccount < Account

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter an initial balance of at least $10,000." unless initial_balance >= 10_000
			super

			@frozen_account = false
			@allowed_transactions = 6
		end

		# max of 6 transactions (deposits/withdrawals)


		def withdraw(amount) 
			@frozen_account = (@account_balance < 10_000) ? true : false

			# while your account is active and you have avail transactions
			while @frozen_account = false && @allowed_transactions > 0 
				
				@account_balance -= amount
				@allowed_transactions -= 1

				if @account_balance < 10,000
					@account_balance -= 100 # penalty fee
					return @account_balance
				else
					return @account_balance
				end
			end

			if @frozen_account
				deposit_needed = 10_000 - @account_balance
				puts "Your account is currently frozen. Please deposit at least #{deposit_needed} in order to unfreeze your account."
			end
		end


		def deposit(amount)
			deposit_needed = 10_000 - @account_balance
				
			if @account_balance < 10_000 && amount >= deposit_needed
				@account_balance += amount
			elsif @allowed_transactions > 0
				@account_balance += amount
				@allowed_transactions -= 1
			else
				puts "I'm sorry. You have already used all of your allotted transactions for this month."
			end

			return @account_balance
		end

		def balance
			super
		end

	end #MoneyMarketAccount
end #BankAccount