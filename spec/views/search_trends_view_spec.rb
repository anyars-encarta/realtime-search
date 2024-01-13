require 'rails_helper'

RSpec.describe "analytics/search_trends.html.erb", type: :view do
    before do
      assign(:sorted_search_queries, {
        "query1" => 3,
        "query2" => 5,
        "query3" => 2
      })
    end
  
    it "displays the table headers correctly" do
      render
      expect(rendered).to have_selector("th", text: "Search Item")
      expect(rendered).to have_selector("th", text: "Search Count")
    end
  
    it "displays the search queries and counts correctly" do
      render
      expect(rendered).to have_selector("td", text: "query1")
      expect(rendered).to have_selector("td", text: "3")
      expect(rendered).to have_selector("td", text: "query2")
      expect(rendered).to have_selector("td", text: "5")
      expect(rendered).to have_selector("td", text: "query3")
      expect(rendered).to have_selector("td", text: "2")
    end
  end