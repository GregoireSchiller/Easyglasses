class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user == record.patient
  end

  def destroy?
    user == record.patient
  end

  def update?
    user == record.patient
  end

end
