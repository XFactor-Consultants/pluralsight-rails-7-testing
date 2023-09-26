require 'rails_helper'

RSpec.describe WikiPost, type: :model do 

    context 'scopes' do 
       let!(:wiki_post1) { WikiPost.create!(title: 'Funny Frogs', description: 'Silly frogs from around the globe.',
        author: 'Billy Bindler', created_at: Time.now) }
        let!(:wiki_post2) { WikiPost.create!(title: 'Monkey Facts',
        description: 'Everything you did and did not want to know about monkeys.', author: 'John Jiles', created_at: 1.day.ago) }
        
    it '#contributors' do 
        contributors = ["Billy Bindler", "John Jiles"]
        expect(WikiPost.contributors).to eq(contributors)
    end 

    it '#sort_by_created_at' do 
        sort_by_created = [wiki_post1, wiki_post2]
        expect(WikiPost.sort_by_created).to eq(sort_by_created)
    end 

    end 
end 