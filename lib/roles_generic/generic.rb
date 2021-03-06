require_all File.dirname(__FILE__) + '/generic'

module Roles
  module Generic  
    def self.included(base) 
      base.extend Roles::Base
      base.extend ClassMethods
      base.orm_name = :generic
    end

    module ClassMethods
      
      MAP = {
        :admin_flag   => "attr_accessor :admin_flag",
        :many_roles   => "attr_accessor :many_roles",
        :one_role     => "attr_accessor :one_role",
        :roles_mask   => "attr_accessor :roles_mask",
        :role_string  => "attr_accessor :role_string",
        :role_strings => "attr_accessor :role_strings",
        :roles_string => "attr_accessor :roles_string"
      }
      
      def strategy name, options=nil
        if options == :default && MAP[name]
          instance_eval MAP[name] 
        end
        role_strategy name, options
      end    
    end
  end
end
