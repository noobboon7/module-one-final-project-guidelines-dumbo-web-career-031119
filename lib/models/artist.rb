class Artist < ActiveRecord::Base
has_many :gigs
has_many :venues, through: :gigs

def self.create_artist(name)
  Artist.create(name: name)
end

def signup
  Gig.create(artist_id: self.id, venue_id:location.id)
end
#
# def search_venues(selected_venue)
#   Venue.all.each do |venue|
#     venue
#   end
end
