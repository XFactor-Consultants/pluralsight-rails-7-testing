# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Wiki Posts', type: :feature do
  let!(:post1) { FactoryBot.create(:wiki_post) }
  let!(:post2) { FactoryBot.create(:wiki_post) }
  let!(:post3) { FactoryBot.create(:wiki_post) }
  let!(:post4) { FactoryBot.create(:wiki_post) }

  let!(:wiki_posts) { WikiPost.all }

  scenario 'Visiting the Wiki Posts page' do
    visit wiki_posts_path
    save_and_open_page

    # Check for the presence of specific elements
    expect(page).to have_selector('th', text: 'Title')
    expect(page).to have_selector('th', text: 'Created at')
    expect(page).to have_selector('th', text: 'Updated at')

    # Check if @wiki_posts data is being displayed correctly
    wiki_posts.each do |post|
      expect(page).to have_link(post.title, href: wiki_post_path(post))
    end

    # Check for the presence of contributors
    expect(page).to have_selector('h2', text: 'Site contributors:')
    expect(page).to have_selector('ul')
    wiki_posts.contributors.compact.each do |contributor|
      expect(page).to have_selector('li', text: contributor.titleize)
    end

    # Check for the presence of the "New wiki post" link
    expect(page).to have_link('New wiki post')
  end
end
