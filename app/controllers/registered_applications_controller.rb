class RegisteredApplicationsController < ApplicationController
  def index
    @registered_apps = RegisteredApplication.all
  end

  def new
    @registered_app = RegisteredApplication.new
  end

  def edit
    @registered_app = RegisteredApplication.find(params[:id])
  end

  def show
    # binding.pry
    @registered_app = RegisteredApplication.find(params[:id])
    @events = @registered_app.events.group_by(&:name)
    # @events = @registered_app.events.group_by_day(:created_at)
  end

  def create
    @registered_app = RegisteredApplication.new(app_params)

    @registered_app.user_id = params[:registered_application][:user]||= current_user.id

    if @registered_app.save
      flash[:notice] = "\"#{@registered_app.name}\" has been successfully registered."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "Bummer!There was an error registering the app :( .Please try again."
      render :new
    end
  end

  def update
    @registered_app = RegisteredApplication.find(params[:id])

    @registered_app.assign_attributes(app_params)

    if @registered_app.save
      flash[notice] = "\"#{@registered_app.name}\" has been successfully updated!"
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "Bummer!There was an error registering the app.Please try again."
      render :edit
    end
  end

  def destroy
    @registered_app = RegisteredApplication.find(params[:id])

    if @registered_app.destroy
      flash[:notice] = "\"#{@registered_app.name}\" has been removed."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "Bummer!There was an error removing the app.Please try again"
      render registered_applications_path
    end
  end

  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end


end
