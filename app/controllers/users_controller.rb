class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def signup
    @user = User.new(name: params[:name], email: params[:email])
  end

  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      image_name: "kkrn_icon_user_1.png"
    )
    if @user.save
      flash[:notice] = "Registration completed"
      redirect_to("/users/#{@user.id}")
    else
      render("signup")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "Editing completed"
      redirect_to("/users")
    else
      render("users/edit")
    end
  end
end