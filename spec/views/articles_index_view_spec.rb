require 'rails_helper'

RSpec.describe 'articles/index.html.erb', type: :view do
  it 'displays the search form correctly' do
    render

    expect(rendered).to have_selector('h1', text: 'Realtime Search')
    expect(rendered).to have_selector('form#search-form')
    expect(rendered).to have_field('query')
    expect(rendered).to have_selector('div.search-buttons')
    expect(rendered).to have_selector("input[type='submit'][value='Search']")
    expect(rendered).to have_selector('a', text: 'Search Trends')
  end
end
