module BankAccounts

	class Account
		attr_reader :id, :balance

		def initialize(id, initial_balance)
			@id 					= id
			@minimum 				= 0
			self.balance			= initial_balance
		end

		def balance=(initial_balance)
			if initial_balance == nil || initial_balance < @minimum 
				raise ArgumentError.new("Initial balance must be at least: #{@minimum}.")
			end
			@balance = initial_balance
		end

		def withdraw(amount)
			if amount > @balance - @minimum 
				puts "You cannot withdraw more than the current account balance: #{@balance}."
				return @balance
			else
				@balance -= amount
			end
		end

		def deposit(amount)
			@balance += amount
		end
	end
end
