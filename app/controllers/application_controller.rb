class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  rescue_from Moped::Errors::OperationFailure, :with => :mongo_insert_failure

  def mongo_insert_failure
    redirect_to new_blogger_registration_path, :alert => 'nickname already taken, think unique'
  end

end
