require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#create' do
    before do
      post :create, params
    end

    context 'with empty params' do
      let(:params) { { user: { email: '', password: '' } } }
      it { expect(response.status).to eq 401 }
    end

    context 'with incorrect email' do
      let(:user) do
        FactoryGirl.create :user, password: 'password',
                                  password_confirmation: 'password'
      end

      let(:params) do
        { user: {
            email: user.email,
            password: 'password'
          }
        }
      end

      let(:current_user_json) { { current_user: user.to_json } }

      it { expect(response.status).to eq 200 }
    end
  end
end
