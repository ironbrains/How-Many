class User < ActiveRecord::Base
  require 'json_web_token'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def auth_token
    JsonWebToken.encode(user: email)
  end
end
