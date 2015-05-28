describe BankAccount::Account do

  describe 'attr_reader' do
    it 'responds to #new' do
      expect(BankAccount::Account).to respond_to :new
    end
  end

end
