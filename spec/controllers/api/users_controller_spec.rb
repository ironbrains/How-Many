require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe '#index' do
    let(:user) { FactoryGirl.create :user }
    before do
      request.headers['Authorization'] = auth_token
      get :index
    end

    context 'when auth token is invalid' do
      context 'nil' do
        let(:auth_token) { nil }
        it { expect(response.status).to eq 401 }
      end

      context 'wrong string' do
        let(:auth_token) { 'someWrongString' }
        it { expect(response.status).to eq 401 }
      end
    end

    context 'when auth token is valid' do
      let(:auth_token) { user.auth_token }
      it { expect(response.status).to eq 200 }
    end
  end

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
