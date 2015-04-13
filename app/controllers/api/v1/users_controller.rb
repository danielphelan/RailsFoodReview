class Api::V1::UsersController < Devise::RegistrationsController
            respond_to :json

            def index
              @users = User.all
              respond_with(@users)

            end
            def show
                @user = User.find(params[:id])
                respond_with (@user)
            end

            def create
                @user = User.new(user_params)
                @user.skip_confirmation!
                if @user.save
                    respond_with @user
                else
                end
              end
               
            

            private

                def user_params
                    params.require(:user).permit(:name, :email, :password, :password_confirmation)
                end
            end
