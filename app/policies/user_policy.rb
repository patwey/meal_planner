# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    false # TODO: @user.admin?
  end

  def show?
    @user.present?
  end

  def new?
    create?
  end

  def edit?
    destroy?
  end

  def create?
    !@user
  end

  def update?
    destroy?
  end

  def destroy?
    @user.present? && @user.id == @record.id # TODO: || @user.admin?
  end
end
