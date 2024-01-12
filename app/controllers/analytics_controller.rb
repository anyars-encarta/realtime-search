class AnalyticsController < ApplicationController
  def search_trends
    @search_queries = SearchQuery.group(:query).count
  end
end
