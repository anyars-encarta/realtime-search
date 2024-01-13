require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe "GET #index" do
      it "assigns @articles with all articles when no search query is present" do
        article1 = create(:article)
        article2 = create(:article)
        
        get :index
        
        expect(assigns(:articles)).to match_array([article1, article2])
      end
  
      it "assigns @articles with filtered articles when search query is present" do
        article1 = create(:article, title: "sample title1", content: "Sample content1")
        article2 = create(:article, title: "sample title2", content: "Sample content2")
        article3 = create(:article, title: "sample title3", content: "Sample content3")
        
        get :index, params: { query: "Sample" }
        
        expect(assigns(:articles)).to match_array([article1, article2, article3])
      end
      
      it "calls record_search_query method when search query is present" do
        expect(controller).to receive(:record_search_query).with("Sample")
        
        get :index, params: { query: "Sample" }
      end
      
      it "renders the index template" do
        get :index
        
        expect(response).to render_template("index")
      end
    end
  
    describe "GET #search_results" do
      it "assigns @articles with filtered articles based on search query" do
        article1 = create(:article, title: "sample title1", content: "Sample content1")
        article2 = create(:article, title: "sample title2", content: "Sample content2")
        article3 = create(:article, title: "sample title3", content: "Sample content3")
        
        get :search_results, params: { query: "Sample" }
        
        expect(assigns(:articles)).to match_array([article1, article2, article3])
      end
      
      it "calls record_search_query method" do
        expect(controller).to receive(:record_search_query).with("Sample")
        
        get :search_results, params: { query: "Sample" }
      end
      
      it "renders the search_results template" do
        get :search_results
        
        expect(response).to render_template("search_results")
      end
    end
  
    describe "#record_search_query" do
      it "creates a new SearchQuery record when query length is >= 3" do
        expect {
          controller.send(:record_search_query, "Sample")
        }.to change(SearchQuery, :count).by(1)
      end
  
      it "does not create a new SearchQuery record when query length is < 3" do
        expect {
          controller.send(:record_search_query, "Sa")
        }.not_to change(SearchQuery, :count)
      end
    end
  end