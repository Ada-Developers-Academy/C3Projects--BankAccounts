module BankAccounts

	class SavingsAccount < BankAccounts::Account

		def initialize(id, initial_balance)
			super
			@minimum 		= 10
			self.balance 	= initial_balance
		end

		def withdraw(amount)
			return @balance if amount == 0
			super(amount + 2)
		end

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
