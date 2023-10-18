require 'rails_helper'
RSpec.describe WikiPostSerializer do 
    describe '#serialize' do 
        let!(:title) {'test'}
        let!(:description) {'test'}
        let!(:author) {'test'}
        it 'correctly serializes the Wikipost object' do 
            wikipost = WikiPostHelper.create_wiki_post(title: title, description: description, author: author)
            expected_result = {:id=>wikipost.id, 
                            :created_at=>wikipost.created_at.strftime("%a %d %b %Y"), 
                            :updated_at=>wikipost.updated_at.strftime("%a %d %b %Y"), 
                            :title=>title, 
                            :description=>description, 
                            :author=>author}
            expect(WikiPostSerializer.serialize(wikipost)).to eq(expected_result)
        end 
    end 
end 