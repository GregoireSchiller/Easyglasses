class PrescriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user == record.patient
  end

  def update?
    user == record.ophtalmo
  end

end
