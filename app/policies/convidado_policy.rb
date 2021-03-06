class ConvidadoPolicy < ApplicationPolicy
  def index?
    user.present? 
  end

  def create?
    update?
  end
  def update?
    user.present? && (record.fiesta.users.first == user || user.role?(:admin))
  end

  def destroy?
    update?
  end
end