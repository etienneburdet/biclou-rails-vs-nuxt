class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def search?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end
end
