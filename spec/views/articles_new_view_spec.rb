require 'rails_helper'

RSpec.describe "articles/new", type: :view do
    it "displays the new article form" do
      assign(:article, Article.new)
      render
  
      expect(rendered).to have_selector('div.new-section')
      expect(rendered).to have_selector('h2', text: 'New Article')
      expect(rendered).to have_selector('form#new-form')
      expect(rendered).to have_selector('input[type="text"][name="article[title]"][required]')
      expect(rendered).to have_selector('textarea[name="article[content]"][required]')
      expect(rendered).to have_selector('input[type="submit"][value="Create Article"]')
    end
end