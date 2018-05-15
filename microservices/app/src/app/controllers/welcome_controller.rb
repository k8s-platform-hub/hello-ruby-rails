class WelcomeController < ApplicationController
  def index
      render json: "Hello World!"
  end

  def get_articles
    render json: Article.all
  end
end
