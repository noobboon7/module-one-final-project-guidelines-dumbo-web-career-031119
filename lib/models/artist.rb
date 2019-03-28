class Artist < ActiveRecord::Base
has_many :gigs
has_many :venues, through: :gigs

# attr_accessor :bio, :name


  def artist_gigs
    self.gigs.each do |gig|
    puts gig.venue.name
    end

  end

  def artist_venues
    Gig.where(artist_id: self.id).each do |gig|
      puts gig.venue.name
    end
  end

end
