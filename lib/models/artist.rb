class Artist < ActiveRecord::Base
has_many :gigs
has_many :venues, through: :gigs

def signup (location)
  Gig.create(artist_id: self.id, venue_id:location.id)
end
end
