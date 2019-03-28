class Artist < ActiveRecord::Base
has_many :gigs
has_many :venues, through: :gigs


# def self.signup(name)
#
#   Gig.create(artist_id: self.id, venue_id:location.id)
# end


def artist_venues
  Gig.where(artist_id: self.id).each do |gig|
    puts gig.venue.name
  end
end

end
