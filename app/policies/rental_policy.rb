class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
  
  def new?
    true
  end
  def create?
    record.user == user
  end

  def update?
    record.user == user
  end
end
