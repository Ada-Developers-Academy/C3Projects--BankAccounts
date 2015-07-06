module BankAccount

	class MoneyMarketAccount < Account

		attr_reader :id, :initial_balance, :account_balance, :frozen_account, :allowed_transactions

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter an initial balance of at least $10,000." unless initial_balance >= 10_000
			super

			@frozen_account = false # account begins with >= 10_000 balance
			@allowed_transactions = 6 # max of 6 transactions/month
		end

		def withdraw(amount) 
			@frozen_account = (@account_balance < 10_000) ? true : false

			if @frozen_account
				deposit_needed = 10_000 - @account_balance
				puts "Your account is currently frozen. Please deposit at least #{deposit_needed} in order to unfreeze your account."
				return @account_balance
			end

			if @allowed_transactions == 0
				puts "I'm sorry. You have already used all of your allotted transactions for this month."
			end

			# while account is active & you have avail transactions
			while @frozen_account == false && @allowed_transactions > 0 
				
				@account_balance -= amount
				@allowed_transactions -= 1

				if @account_balance < 10_000
					@account_balance -= 100 # penalty fee
					return @account_balance
				else
					return @account_balance
				end
			end

		end


		def deposit(amount)
			deposit_needed = 10_000 - @account_balance
				
			# if you're below balance and deposit enough to get out of "the red"
			# you can deposit regardless of allowed_transactions
			# and it won't count toward that count
			if @account_balance < 10_000 && amount >= deposit_needed
				@account_balance += amount

			# no matter your balance, if you have allowed_transactions
			# you can make a deposit
			# it will reduce your allowed_transactions by 1 each time
			elsif @allowed_transactions > 0
				@account_balance += amount
				@allowed_transactions -= 1
			
			# if you're out of transactions
			# and the first "if" exception does not apply
			# then you cannot make a deposit
			else
				puts "I'm sorry. You have already used all of your allotted transactions for this month."
			end

			# returns account_balance regardless of scenario from above
			return @account_balance
		end

		def balance
			super
		end

		def add_interest(rate)
			interest = @account_balance * (rate / 100)
			@account_balance += interest.round(2)
			return interest.round(2)
		end

		# reset_transactions -- I did this method the opposite way 
		# as the instructions said since my logic is counting down 
		# transactions from 6 rather than adding them up to 6
		def reset_transactions 
			@allowed_transactions = 6
			return @allowed_transactions
		end

	end #MoneyMarketAccount
end #BankAccount