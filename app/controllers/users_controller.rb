class UsersController < ApplicationController
  # before_destroy :do_not_delete_self
  def index
    @users = User.order(:name)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    # byebug
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # byebug
    @user = User.find(params[:id])
  end

  def destroy
    # byebug
    @user = User.find(params[:id])
    # begin
      unless @user.id == session[:user_id]
        @user.destroy
        flash[:notice] = "User #{@user.name} deleted"
      else
        flash[:notice] = "Can't delete self record"
      end
    # rescue StandardError => e
    #   flash[:notice] = e.message
    # end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def create
    # debugger
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully created." }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  # def do_not_delete_self
  #   @user = User.find(params[:id])
  #   # begin
  #   if @user.id == session[:user_id]
  #     flash[:notice] = "Don't delete self"
  #   end
  #   # rescue
  # end
end
