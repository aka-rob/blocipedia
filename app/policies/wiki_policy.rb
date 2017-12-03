class WikiPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    if record.private?
      user.admin? || user.premium?
    else
      user.present?
    end
  end

  def create?
    if record.private?
      user.admin? || user.premium?
    else
      user.present?
    end
  end

  def new?
    create?
  end

  def update?
    if record.private?
      user.admin? || user.premium?
    else
      user.present?
    end
  end

  def edit?
    update?
  end

  def destroy?
    user && user.admin?
  end

  class Scope < Scope
    def resolve
      if user && (user.admin? || user.premium?)
        scope
      else
        scope.where(private: :false)
      end
    end
  end
end
