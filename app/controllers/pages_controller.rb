class PagesController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:landing_page]
end
