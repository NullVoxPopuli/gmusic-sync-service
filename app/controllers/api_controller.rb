class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user_from_token!
  respond_to :json

  def current_user
     @current_user ||= authenticate_user_from_token!
   end

  def authenticate_user_from_token!
      email = request.headers[:email].presence
      token = request.headers[:token].presence
      user = email && User.find_by_email(email)

      if user
        # if !user.confirmed?
          # user.errors.add(:base, I18n.t('devise.failure.unconfirmed'))
        if Devise.secure_compare(user.authentication_token, token)
          @current_user = user
          sign_in(:user, user)
      end
    end
  end
end
