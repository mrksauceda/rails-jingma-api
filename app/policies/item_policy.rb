class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # ///////example
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(published: true)
      # end
    end
  end

  def show?
    true # Anyone can view a item
  end

  def create?
    true # Anyone can create a item
  end

  def update?
    record.user == user # Only item creator can update it
  end

  def destroy?
    record.user == user # Only item creator can destroy it
  end
end
