module BankAccount

	class MoneyMarketAccount < Account

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter an initial balance of at least $10,000." unless initial_balance >= 10_000
			super

			@frozen_account = false
		end

		# max of 6 transactions (deposits/withdrawals)


		def withdraw(amount) 
			frozen_account = (@account_balance < 10_000) ? true : false

			while frozen_account = false
				@account_balance -= amount

				if @account_balance < 10,000
					@account_balance -= 100 # penalty fee
					return @account_balance
				else
					return @account_balance
				end
			end
		end


		def deposit(amount)
			super
		end

		def balance
			super
		end

	end #MoneyMarketAccount
end #BankAccount