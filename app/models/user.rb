class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :songs

  before_save :ensure_authentication_token


  private

  def ensure_authentication_token
    if authentication_token.blank?
       self.authentication_token = generate_authentication_token
     end
  end


  def generate_authentication_token
    # loop so that we ensure we never get a duplicate token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end