module WikiPostHelper 
    def self.create_wiki_post(attrs = {})
        WikiPost.create!(attrs)
    end 
end 