class Api::Users::ProfilesController < Api::Users::BaseController
  # GET /api/user/profile
  def show
    return render json: {
      email: current_user.email,
    }
  end
end
