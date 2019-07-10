class PortfoliosController < ApplicationController
    
    before_action :set_user, only:[:show]
    before_action :logged_in?
    
    


end
