module BankAccounts

	class MoneyMarketAccount < Account

		attr_reader	:transactions_remaining

		def initialize(id, initial_balance)
			super
			@minimum 				= 10_000
			self.balance 			= initial_balance
			# hardcoding the number of transactions permitted and working down
			@transactions_remaining	= 6
			@low_balance			= false
		end

		def validate_withdrawal(amount)
			valid = true
			return "You've already used all 6 transactions for this month." if @transactions_remaining == 0
			unless @low_balance
				@transactions_remaining -= 1
				if @balance - amount < 10_000
					puts "You cannot make anymore withdrawals until your balance is $10k."
					amount_to_withdraw = amount + 100
					@low_balance = true
					return amount_to_withdraw, valid
				else
					return amount, valid
				end
			else
				puts "You cannot withdraw until your balance is $10k."
				valid = false
				return amount, valid
			end
		end

		def deposit(amount)
			starting_balance = @balance
			super
			ending_balance = @balance
			@transactions_remaining -= 1 unless starting_balance < 10_000 && ending_balance > 10_000
			return @balance
		end

		# reset the transactions to the allowed number of 6
		def reset_transactions
			@transactions_remaining = 6
		end

		# this is the same as SavingsAccount#add_interest
		def add_interest(amount)
			if amount == nil || amount < 0
				raise ArgumentError.new("Interest rate cannot be negative.")
			end
			interest = @balance * (amount.to_f/100)
			@balance += interest
			return interest
		end
	end
end
