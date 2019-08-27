class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :stats, :about]

  def home
  end

  def stats
  end

  def about
  end
end
