module BankAccounts

	class CheckingAccount < Account
		def initialize(id, initial_balance)
			super
			@minimum = 0
		end

		def withdraw(amount)
			return @balance if amount == 0
			super(amount + 1)
		end
	end
end
