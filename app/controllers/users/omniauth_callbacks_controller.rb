class Users::OmniauthCallbacksController < ApplicationController
  # GET /users/auth/google_oauth2/callback
  def google_oauth2
    authenv = request.env['omniauth.auth']

    # authenvが空なら400
    return render plain: '400 Bad request', status: 400 unless authenv

    # authenvからuser特定or作成
    @user = find_or_create_user_by_authenv(authenv)

    # userがDB登録された場合、セッション生成する
    create_session(@user) if @user.persisted?

    # 元のURLにリダイレクト
    return redirect_to request.env['omniauth.origin']
  end

  private

  def find_or_create_user_by_authenv(authenv)
    User.find_or_create_by(
      uid:        authenv.uid,
      provider:   authenv.provider,
      email:      authenv.info.email,
    )
  end

  def create_session(user)
    session[:user_id] = user.id
  end
end
