require 'rails_helper'

RSpec.describe AnalyticsController, type: :controller do
  describe 'GET #search_trends' do
    it 'assigns @search_queries with grouped search queries' do
      create(:search_query, query: 'query1')
      create(:search_query, query: 'query2')

      get :search_trends

      expect(assigns(:search_queries)).to eq({ 'query1' => 1, 'query2' => 1 })
    end

    it 'assigns @sorted_search_queries with sorted search queries' do
      create(:search_query, query: 'query1')
      create(:search_query, query: 'query2')
      create(:search_query, query: 'query2')

      get :search_trends

      expect(assigns(:sorted_search_queries)).to eq({ 'query2' => 2, 'query1' => 1 })
    end

    it 'renders the search_trends template' do
      get :search_trends

      expect(response).to render_template('search_trends')
    end
  end
end
