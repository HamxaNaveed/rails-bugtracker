class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      
    end

  end

  def index?
  end

  def new?
    user.role.name == "manager"
  end

  def show?
    user.id == record.qa_id || record.developer_ids.include?(user.id) || user.role.name == "manager"
  end

end
