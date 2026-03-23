class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    render plain: "Landing Page Placeholder"
  end
end
