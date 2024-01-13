class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search(params[:query])
      record_search_query(params[:query])
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: 'Article was successfully created.'
    else
      render :new
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

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
