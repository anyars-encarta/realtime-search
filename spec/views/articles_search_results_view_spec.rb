require 'rails_helper'

RSpec.describe 'articles/search_results.html.erb', type: :view do
  context 'when @articles is present' do
    before do
      assign(:articles, [
               FactoryBot.build_stubbed(:article, title: 'Sample title1', content: 'Sample content1'),
               FactoryBot.build_stubbed(:article, title: 'Sample title2', content: 'Sample content2')
             ])
      render
    end

    it 'displays the search results correctly' do
      expect(rendered).to have_selector('h2', text: 'Search Results')
      expect(rendered).to have_selector('h3', text: 'Sample title1')
      expect(rendered).to have_selector('p', text: 'Sample content1')
      expect(rendered).to have_selector('h3', text: 'Sample title2')
      expect(rendered).to have_selector('p', text: 'Sample content2')
    end

    it "does not display 'No matches found' message" do
      expect(rendered).not_to have_selector('.no-match')
    end
  end

  context 'when @articles is empty' do
    before do
      assign(:articles, [])
      render
    end

    it "displays 'No matches found' message" do
      expect(rendered).to have_selector('.no-match', text: 'No matches found')
    end
  end
end
