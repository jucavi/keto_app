class PagesController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :configure_permitted_parameters
end
