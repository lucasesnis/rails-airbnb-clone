class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    create?
  end

  def create?
    return true
  end

  def edit?
    update?
  end

  def update?
    return true
  end

  def destroy?
    return true
  end
end
