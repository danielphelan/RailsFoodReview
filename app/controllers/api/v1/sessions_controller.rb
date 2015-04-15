class Api::V1::SessionsController < Devise::SessionsController
  # skip_before_filter :restrict_access
  respond_to :json

  def create
    @resource = User.find_by(email_params)
    
    if @resource
      if @resource.valid_password?(params[:user][:password])
        respond_with @resource
      else
        render :status => 404, json:{ message: 'Incorrect password entered- try again' }
       
      end
    else
      render :status => 404, json: { message: 'User does not exist- sign up' }
    end    
  end

    private 

    def email_params
      params.require(:user).permit(:name,:email)
    end 
end