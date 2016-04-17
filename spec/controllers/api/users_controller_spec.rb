require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe '#create' do
    context 'with different password & confirmation' do
      let(:params) do
        { user: {
          email: 'email@example.com',
          password: 'password1',
          password_confirmation: 'password2' }
        }
      end

      it { expect{ post :create, params }.not_to change User, :count }

      it 'response has unauthorized status' do
        post :create, params
        expect(response.status).to eq 401
      end
    end

    context 'with same password & confirmation' do
      let(:params) do
        { user: {
          email: 'email@example.com',
          password: 'password1',
          password_confirmation: 'password1' }
        }
      end

      it { expect{ post :create, params }.to change User, :count }

      it 'response has OK status' do
        post :create, params
        expect(response.status).to eq 200
      end
    end
  end
end
