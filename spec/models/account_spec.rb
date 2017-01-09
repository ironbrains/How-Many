require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { FactoryGirl.create :account, balance: balance }

  describe '#withdraw' do

    context 'when account has needed balance' do
      let(:balance) { 1000.00 }
      let(:sum) { 900 }

      it { expect { account.withdraw sum }.to change account, :balance }
    end

    context 'when account does not have needed balance' do
      let(:balance) { 100.00 }
      let(:sum) { 900 }

      it { expect { account.withdraw sum }.not_to change account, :balance }
    end
  end

  describe '#deposit' do
    let(:balance) { 100 }
    let(:sum) { 500 }

    it { expect { account.deposit sum }.to change(account, :balance).by sum }
  end
end
