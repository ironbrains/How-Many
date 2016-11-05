class User < ActiveRecord::Base
  require 'json_web_token'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts

  def auth_token
    JsonWebToken.encode(user: email)
  end


  def self.find_by_auth_token(token)
    find_by(email: decode_email(token))
  end

  protected

  def self.decode_email(auth_header)
    (token = auth_header.split(' ').last) &&
    JsonWebToken.decode(token)[0]['user']
  rescue
    nil
  end
end
