module BankAccounts

	class Account
		attr_reader :id, :balance

		def initialize(id, initial_balance)
			@id 					= id
			self.initial_balance	= initial_balance
		end

		def initial_balance=(initial_balance)
			if initial_balance == nil || initial_balance < 0
				raise ArgumentError.new("Initial balances cannot be nil or negative.")
			end
			@balance = initial_balance
		end

		def withdraw(amount)
			if amount > @balance
				puts "You cannot withdraw more than the current account balance: #{@balance}."
				return @balance
			else
				@balance -= amount
			end
		end
	end
end
