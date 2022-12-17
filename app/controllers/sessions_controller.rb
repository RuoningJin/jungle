class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])

      session[:user_id] = user.id
      redirect_to [:root]
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    render :new
  end
end
