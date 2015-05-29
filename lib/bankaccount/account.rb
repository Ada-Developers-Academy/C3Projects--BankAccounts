module BankAccount

	class Account

		attr_accessor :id, :initial_balance, :account_balance

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter a positive initial balance." unless initial_balance >= 0
				@id = id
				@initial_balance = initial_balance
				@account_balance = initial_balance
		end

		def withdraw(amount)
			super 
			
			fee = 2

			@account_balance = @account_balance - amount - fee

			# if @account_balance < 0
			# 	@account_balance += amount + fee
			# 	raise ArgumentError.new "Insufficient funds. Your current balance is #{@account_balance}."
			# 	return @account_balance
			# else 
			# 	return @account_balance
			# end

			return @account_balance
		end

		def deposit(amount)
			@account_balance += amount
			return @account_balance
		end

		def balance
			return @account_balance
		end

	end

end