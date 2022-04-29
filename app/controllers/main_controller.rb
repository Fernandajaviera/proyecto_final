class MainController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == "vet"
        redirect_to appointments_path
      end

      if current_user.role == "client"
        redirect_to pets_path
      end
    end
  end
end
