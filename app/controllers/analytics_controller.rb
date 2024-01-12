class AnalyticsController < ApplicationController
  def search_trends
    @search_queries = SearchQuery.group(:query).count
    @sorted_search_queries = @search_queries.sort_by { |_query, count| count }.reverse.to_h
  end
end
