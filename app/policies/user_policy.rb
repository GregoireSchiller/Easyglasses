class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record == user
  end

  def update_user_after_onboarding?
    record == user
  end
end
