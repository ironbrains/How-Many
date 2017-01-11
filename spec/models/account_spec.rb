require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { FactoryGirl.create :account, balance: balance }

  describe '#withdraw' do
    context 'when account has needed balance' do
      let(:balance) { 1000.00 }
      let(:sum)     { 900 }

      it 'does execute' do
        expect { account.withdraw sum }.to change(account, :balance)
          .and change(Transaction, :count)
      end
    end

    context 'when account does not have needed balance' do
      let(:balance) { 100.00 }
      let(:sum)     { 900 }

      it 'does not execute' do
        expect { account.withdraw sum }.not_to change(account, :balance)
      end
    end
  end

  describe '#deposit' do
    let(:balance) { 100 }
    let(:sum)     { 500 }

    it 'does execute' do
      expect { account.deposit sum }.to change(account, :balance).by(sum)
        .and change(Transaction, :count)
    end
  end

  describe '#destroy' do
    context 'when balance is zero' do
      let!(:account) { FactoryGirl.create :account, balance: 0 }

      it { expect { account.destroy }.to change(Account, :count).by(-1) }
    end

    context 'when balance is not zero' do
      let!(:account) { FactoryGirl.create :account, balance: 100 }

      it { expect { account.destroy }.not_to change(Account, :count) }
    end
  end
end
