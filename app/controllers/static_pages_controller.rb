class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "landing_page"

  def index
  end

  def privacy
  end

  def terms
  end
end
