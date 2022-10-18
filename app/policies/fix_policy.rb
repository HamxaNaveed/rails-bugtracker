class FixPolicy < ApplicationPolicy
    class Scope < Scope
  
      def resolve
        
      end
    end
  
    def new?
      @user.role.name == "qa"
    end

    def assign?
      user.role.name == "developer"
    end

    def complete?
      user.role.name == "developer"
    end
  end
  