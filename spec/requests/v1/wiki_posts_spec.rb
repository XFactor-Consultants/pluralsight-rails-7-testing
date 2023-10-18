# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WikiPosts API', type: :request do
  describe 'GET /api/v1/wiki_posts/:id' do
    before do
      allow_any_instance_of(Api::V1::WikiPostsController).to receive(:authenticate)
        .and_return(true)
    end
    let!(:wiki_post) { FactoryBot.create(:wiki_post) }
    let!(:endpoint) { "/api/v1/wiki_posts/#{wiki_post.id}" }
    it 'returns the requested wikipost' do
      # make a GET request to the show action
      get endpoint
      # expect a successful response status(HTTP 200 OK)
      expect(response).to have_http_status(:ok)
      # parse JSON response body
      json_response = JSON.parse(response.body)
      # validate the content of the response matches the created wikipost
      expect(json_response['id']).to eq(wiki_post.id)
      expect(json_response['title']).to eq(wiki_post.title)
      expect(json_response['description']).to eq(wiki_post.description)
      expect(json_response['author']).to eq(wiki_post.author)
    end
  end
end
