class Artist < ActiveRecord::Base
has_many :gigs
has_many :venues, through: :gigs

def signup (location)
  Gig.create(artist_id: self.id, venue_id:location.id)
end

def search_venues(user_location)
  Venue.find_by(location: user_location)
end

end
