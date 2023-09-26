class WikiPostSerializer 
    attr_accessor :wiki_post 

    def initialize(wiki_post)
        @wiki_post = wiki_post 
    end 

    def self.serialize(wiki_post)
        {
            id: wiki_post.id,
            created_at: wiki_post.created_at.strftime("%a %d %b %Y"), 
            updated_at: wiki_post.updated_at.strftime("%a %d %b %Y"),
            title: wiki_post.title,
            description: wiki_post.description,
            author: wiki_post.author
        }
    end 



 
end 