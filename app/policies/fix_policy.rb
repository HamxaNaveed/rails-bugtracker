class FixPolicy < ApplicationPolicy
    class Scope < Scope
  
      def resolve
        
      end
    end
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def new?
      user.role.name == "qa"
    end

    def assign?
      user.role.name == "developer"
    end

    def complete?
      record.assign_to_id == user.id
    end
  end
  