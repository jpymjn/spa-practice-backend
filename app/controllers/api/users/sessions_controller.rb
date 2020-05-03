class Api::Users::SessionsController < Api::Users::BaseController
  # DELETE /api/user/session
  def destroy
    destroy_session
    return render plain: 'OK'
  end

  private

  def destroy_session
    session[:user_id] = nil
  end
end
