class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:inicio, :about, :contact]
def inicio
end
def about
end
def contact
end
end
