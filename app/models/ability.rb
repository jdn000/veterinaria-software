class Ability
  include CanCan::Ability
#def user
 # user= current_user
#end
  def initialize(user)

   # if user.nil?
      # if no user logged in, use a dummy user, see later
   # user ||= User.new
   # end

    #if user.role==:admin
  #    can :manage, :all
    
    #elsif user.role== :cliente 
    #  alias_action :create, :read, :update,:index, :to => :cru
    #  can :cru,:new, Pet
     # can :cru, cliente 
     # end
  end

end
