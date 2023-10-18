# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Wiki Post Show', type: :feature do
  context 'crud operations' do
    context 'delete' do
      it 'deletes a wikipost from the show page' do
        # create a test record with factorybot
        wiki_post = FactoryBot.create(:wiki_post)
        # visit the show page of the record
        visit wiki_post_path(wiki_post)
        # verify the record's attributes are displayed
        expect(page).to have_link('Edit this wiki post')
        # click the delete button
        click_button('Delete')
        expect(WikiPost.count).to eq(0)
        # verify we are redirected after deletion
        expect(current_path).to eq(wiki_posts_path)
      end
    end
    context 'edit' do
      it 'edits a wikipost from the show page' do
        wiki_post = FactoryBot.create(:wiki_post)
        title = 'Paul Bunyans Flowers'

        visit wiki_post_path(wiki_post)
        click_link('Edit this wiki post')

        fill_in 'Title', with: title
        click_button 'Edit'

        expect(current_path).to eq(wiki_post_path(wiki_post))
      end
    end
  end
end
