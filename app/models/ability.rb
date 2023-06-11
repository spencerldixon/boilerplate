# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    ### Everything below this line requires login ###
    return unless user.present?

    ### Admin permissions ###
    return unless user.admin? # Admin can do everything above, plus everything below
  end
end
