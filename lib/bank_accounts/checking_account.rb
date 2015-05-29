module BankAccounts

	class CheckingAccount < Account
		attr_reader :check_count

		def initialize(id, initial_balance)
			super
			@minimum 				= 0
			@overdraft_limit	 	= -10
			@check_count 			= 0
		end

		def withdraw(amount)
			return @balance if amount == 0
			super(amount + 1)
		end

		def withdraw_using_check(amount)
			if check_count < 3
				withdraw(amount - 1)
			else
				withdraw(amount + 1)
			end

			@check_count += 1
		end

		def reset_checks
			@check_count = 0
		end
	end
end
