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
			if amount > @balance - @overdraft_limit
				puts "You cannot withdraw past the overdraft limit: #{@overdraft_limit}."
				return @balance
			end

			if check_count < 3
				@balance -= amount
			else
				@balance -= (amount + 2)
			end
			
			@check_count += 1
			return @balance
		end
	end
end
