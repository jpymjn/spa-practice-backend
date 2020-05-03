class Api::Users::BaseController < ApplicationController
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  before_action *[
    :return_401_unless_signed_in,
  ]
  after_action *[
    :set_csrf_token_header,
  ]

  private

  def return_401_unless_signed_in
    return render plain: 'NG', status: 401 unless current_user
  end

  def set_csrf_token_header
    response.set_header('x-csrf-token', form_authenticity_token)
  end

  def current_user
    @current_uesr ||= User.find_by(id: session[:user_id])
  end
end
