class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :role

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def full_name
    object.full_name unless object.nil?
  end

  def email
    object.email unless object.nil?
  end
end
