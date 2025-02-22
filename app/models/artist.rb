class Artist < ActiveRecord::Base
    has_many :songs
    has_many :song_genres, through: :songs
    has_many :genres, through: :song_genres

    def slug
        self.name.parameterize
    end

    def self.find_by_slug(slug)
        Artist.all.find {|artist| artist.name.parameterize == slug}
    end
    
end