class SessionsController < Devise::SessionsController
  clear_respond_to
  respond_to :json

  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  skip_before_filter :verify_signed_out_user


  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email
        }
        render json: data, status: 201 and return
      end
    end
  end
end
