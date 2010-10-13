module Roles::Generic::User
  module Implementation
    def role_attribute
      strategy_class.roles_attribute_name
    end       

    # check if a given role has been assigned 
    # if a list of roles: check if ALL of the given roles have been assigned 
    # If the parameter is empty return false
    def has_roles?(*roles)
      # if roles list request is empty and roles_list is empty then there is no roles
      # hence x.has_roles? question
      puts "Is it even firing this"
      if roles.flatten.empty? && roles_list.empty?
        return false
      else
        (roles_list - roles.flatten).empty? 
      end
    end

    # check if any (at least ONE) of the given roles have been assigned
    def has_role? *roles
      (roles_list & roles.flatten).not.empty?            
    end

    def valid_role? role
      strategy_class.valid_roles.include? role.to_sym
    end

    def admin?
      is? :admin
    end
           
    alias_method :has?, :has_role?
    alias_method :is?, :has_roles?        
  end
end    
