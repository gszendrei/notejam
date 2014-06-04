Notejam::App.controllers :user do

  layout :user

  get :signup, :map => '/signup' do
    render "user/signup"
  end

  post :signup, :map => '/signup' do
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'Now you can sign in'
      redirect url(:user, :signin)
    end
    render "user/signup"
  end

  get :signin, :map => '/signin' do
    render "user/signin"
  end

  post :signin, :map => '/signin' do
    if user = User.authenticate(params[:email], params[:password])
      set_current_account(user)
      redirect url(:note, :all_notes)
    else
      params[:email] = h(params[:email])
      flash.now[:error] = "Invalid credentials"
      render "user/signin"
    end
  end

  get :signout, :map => '/signout' do
    set_current_account nil
    redirect url(:pad, :create)
  end

  get :settings, :map => '/settings' do
    @user = current_account
    render "user/settings"
  end

  post :settings, :map => '/settings' do
    @user = current_account
    if @user.has_password? params[:current_password]
      params[:user][:crypted_password] = nil
      @user.update(params[:user])
      if @user.save
        flash[:success] = 'Password was successfully changed.'
        redirect url(:note, :all_notes)
      end
    else
      flash[:error] = 'Entered current password is incorrect.'
      redirect url(:user, :settings)
    end

    render "user/settings"
  end
end
