class ArticlesController < ApplicationController
  def index
    @articles = if params[:query].present?
                  SearchQuery.create(query: params[:query], ip_address: request.remote_ip)
                  Article.search(params[:query])
                else
                  Article.all
                end
  end
end
