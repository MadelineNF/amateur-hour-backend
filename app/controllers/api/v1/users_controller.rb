class Api::V1::UsersController < Api::V1::BaseController
  def index
    respond_with User.all
  end
  def show
    user = User.find(params["id"])
    respond_with user, json: user
  end
  def create
    respond_with :api, :v1, User.create(user_params)
  end
  def destroy
    respond_with User.destroy(user_params)
  end
  def update
    user = User.find(params["id"]) 
    user.update_attributes(user_params) 
    respond_with user, json: user
  end

  private
  def user_params
    params.require(:user).permit(:id, :firstName, :lastName)
  end
end