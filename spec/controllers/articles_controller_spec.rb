require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'assigns @articles with all articles when no search query is present' do
      article1 = create(:article)
      article2 = create(:article)

      get :index

      expect(assigns(:articles)).to match_array([article1, article2])
    end

    it 'assigns @articles with filtered articles when search query is present' do
      article1 = create(:article, title: 'sample title1', content: 'Sample content1')
      article2 = create(:article, title: 'sample title2', content: 'Sample content2')
      article3 = create(:article, title: 'sample title3', content: 'Sample content3')

      get :index, params: { query: 'Sample' }

      expect(assigns(:articles)).to match_array([article1, article2, article3])
    end

    it 'calls record_search_query method when search query is present' do
      expect(controller).to receive(:record_search_query).with('Sample')

      get :index, params: { query: 'Sample' }
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #search_results' do
    it 'assigns @articles with filtered articles based on search query' do
      article1 = create(:article, title: 'sample title1', content: 'Sample content1')
      article2 = create(:article, title: 'sample title2', content: 'Sample content2')
      article3 = create(:article, title: 'sample title3', content: 'Sample content3')

      get :search_results, params: { query: 'Sample' }

      expect(assigns(:articles)).to match_array([article1, article2, article3])
    end

    it 'calls record_search_query method' do
      expect(controller).to receive(:record_search_query).with('Sample')

      get :search_results, params: { query: 'Sample' }
    end

    it 'renders the search_results template' do
      get :search_results

      expect(response).to render_template('search_results')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new article' do
        expect do
          post :create, params: { article: attributes_for(:article) }
        end.to change(Article, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, params: { article: attributes_for(:article) }
        expect(response).to redirect_to(articles_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new article' do
        expect do
          post :create, params: { article: attributes_for(:article, title: nil) }
        end.not_to change(Article, :count)
      end

      it 'renders the new template' do
        post :create, params: { article: attributes_for(:article, title: nil) }
        expect(response).to render_template('new')
      end
    end
  end
end
