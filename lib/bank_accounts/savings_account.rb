module BankAccounts

	class SavingsAccount < BankAccounts::Account

		MINIMUM_BALANCE = 10
			
		def initial_balance=(initial_balance)
			if initial_balance == nil || initial_balance < MINIMUM_BALANCE
				raise ArgumentError.new("Initial balance must be at least: #{MINIMUM_BALANCE}.")
			end
			@balance = initial_balance
		end

		def withdraw(amount)
			if amount > @balance - MINIMUM_BALANCE
				puts "You cannot leave less than #{MINIMUM_BALANCE} in your account."
				return @balance
			else
				@balance -= (amount + 2)
			end
		end
	end
end
