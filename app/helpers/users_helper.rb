# frozen_string_literal: true

module UsersHelper
  def user_select_options
    User.pluck(:full_name, :id).uniq
  end
end
