module BankAccount

		class Account

		attr_accessor :id, :initial_balance, :current_balance
		
		def initialize(id, initial_balance)
			@id = id
			@initial_balance = initial_balance
			@current_balance = initial_balance	

			if @initial_balance < 0 
				raise ArgumentError, "an error has occurred. Balance must equal more than $0."
			end	
		end

		def withdraw(w_amount)

			if @current_balance <= w_amount
				raise ArgumentError, " I'm sorry. You do not have enough money to complete this transaction. Please try again and/or make a deposit. Thanks. \n #{@current_balance} is currently avaialble."
			else  @current_balance -= w_amount
				puts "Your new balance is #{@current_balance}."
				return @current_balance
			end
		end


		def deposit(d_amount)
			@current_balance += d_amount
			return @current_balance

		end

		def balance
			@current_balance 
		end
		
	end


end