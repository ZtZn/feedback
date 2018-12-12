class FeedbackPolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    true
  end

  def index?
    true if user.present? && user.role == "admin"
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
