class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search(params[:query])
      record_search_query(params[:query])
    else
      @articles = Article.all
    end
  end

  def search_results
    @articles = Article.search(params[:query])
    record_search_query(params[:query])
  end

  private

  def record_search_query(query)
    SearchQuery.create(query:, ip_address: request.remote_ip) if query&.length.to_i >= 3
  end
end
