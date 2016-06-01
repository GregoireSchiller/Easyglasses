class ExamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def desktop_onboarding_eligible?
    user == record.patient
  end

  def desktop_onboarding?
    user == record.patient
  end

  def update_user_after_onboarding_eligible?
    user == record.patient
  end

  def desktop_results?
    user == record.patient
  end


end
