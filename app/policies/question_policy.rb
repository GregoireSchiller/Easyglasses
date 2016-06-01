class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def desktop_questions?
    user == record.patient
  end


end
