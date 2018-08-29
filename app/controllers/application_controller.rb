class ApplicationController < ActionController::Base
# Inside your protected controller
before_action :authenticate_user!
end
