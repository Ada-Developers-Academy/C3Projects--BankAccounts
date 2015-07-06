describe Bank::CheckingAccount do
  it "creates a new instance" do
    expect(Bank::CheckingAccount).to respond_to(:new)
  end

  it "inherits from Bank::Account" do
    expect(Bank::CheckingAccount.superclass).to eq(Bank::Account)
  end

  let(:account) { Bank::CheckingAccount.new("Checking", 1000) }

  describe "#withdraw(amount)" do
    it "withdraws amount from balance" do
      account.withdraw(100) # plus $1 fee
      expect(account.balance).to eq(899)
    end

    # how can I check for the $1 independently?
    it "also withdraws $1 fee and returns balance" do
      expect(account.withdraw(100)).to eq(899)
    end

    context "when amount is greater than account balance" do
      it "doesn't allow the account to go negative" do
        account.withdraw(2000)
        expect(account.balance).to eq(1000)
      end

      it "outputs a warning message" do
        expect{account.withdraw(2000)}.to output("You cannot withdraw more than the balance minimum of $0.\n").to_stdout
      end

      it "returns unmodified balance" do
        expect(account.withdraw(2000)).to eq(1000)
      end
    end
  end

  describe "#withdraw_using_check(amount)" do
    it "withdraws the amount from the account" do
      account.withdraw_using_check(500)
      expect(account.balance).to eq(500)
    end

    it "returns the updated balance" do
      expect(account.withdraw_using_check(50)).to eq(950)
    end

    context "when amount is greater than balance" do
      it "allows account to overdraft" do
        account.withdraw_using_check(1005)
        expect(account.balance).to eq(-5)
      end

      # testing that $1010 withdrawal is okay within first 3 checks
      # after third check, $2 fee would be added (totaling $1012)
      # and would create $12 overdraft which isn't allowed
      it "allows withdrawal to be $10 over balance within first 3 checks" do
        account.withdraw_using_check(1010)
        expect(account.balance).to eq(-10)
        expect(account.check_transactions).to be < 3
      end

      it "doesn't allow account balance to be less than -$10" do
        account.withdraw_using_check(2000)
        expect(account.balance).to eq(1000)
      end

      it "outputs a warning if overdraft would be less than -$10" do
        expect{account.withdraw_using_check(2000)}.to output("Account cannot overdraft over $10.\n").to_stdout
      end
    end

    it "counts how many checks are used" do
      5.times do
        account.withdraw_using_check(20)
      end

      expect(account.check_transactions).to eq(5)
    end

    context "when three checks have been used this month" do
      # used before block to solve scope issue
      # apparently :account can't be used within a context block
      # outside of the individual examples (e.g. it blocks)…?
      before(:each) do
        @account = Bank::CheckingAccount.new("Checking", 1000)

        3.times do
          @account.withdraw_using_check(20)
          # @account.balance = 940
        end
      end

      it "charges a $2 fee per use after the third check transaction" do
        @account.withdraw_using_check(20)
        # 940 - (20 + 2) = 918
        expect(@account.balance).to eq(918)
      end

      it "accounts for $2 fee regarding $10 overdraft limit" do
        expect{@account.withdraw_using_check(950)}.to output("Account cannot overdraft over $10.\n").to_stdout
        # since transaction wasn't completed, it shouldn't count
        # towards that month's used checks
        expect(@account.check_transactions).to be < 4
      end

      # testing that $1010 withdrawal is not okay after first 3 checks
      # after third check, $2 fee would be added (totaling $1012)
      # and would create $12 overdraft which isn't allowed
      it "doesn't allow withdrawal to be $12 over balance" do
        @account.withdraw_using_check(950) # plus $2 fee = 952
        expect(@account.balance).to eq(940)
        # check transaction wasn't completed
        expect(@account.check_transactions).to eq(3)
      end
    end

    it "resets the number of checks used every month" do
      # pretend we withdrew using 5 checks last month
      account.month = 4
      account.check_transactions = 5
      # now try to use a check this month
      account.withdraw_using_check(100)

      expect(account.check_transactions).to eq(1) # just successfully withdrew $100
    end
  end

  describe "#reset_checks" do
    it "resets the number of checks used to 0" do
      account.reset_checks
      expect(account.check_transactions).to eq(0)
    end
  end
end
