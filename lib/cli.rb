#!/usr/bin/env ruby

# greet new user with a desciption of the app, and asks they're artist name
def greet
  $prompt = TTY::Prompt.new
  system "clear"

  puts 'Welcome to gig_finder, the best resource for finding your next gig!'
end

def user
  name = $prompt.ask('What is your name?', default: "artist_name")
  puts "Welcome #{name}!"
  Artist.create_artist(name)
end

def user_menu
  

end
def venue_selection
  @selected_venue = $prompt.select("choose your venue location:") do |menu|
      Venue.all.each do |venue|
        menu.choice venue.name, venue
      end
    end
end

def book
  venue_info = Venue.where(name: @selected_venue.name)
  system "clear"

  venue_info.each do |venue|
    puts "venue name: #{venue.name}
    located in: #{venue.location}
    doors open at: #{venue.open}
    closes at: #{venue.close}
    average ticket: #{venue.prices} "
  end
  booking = $prompt.yes?("would you like to book it!?")
  case booking
  when true
    puts "created"
    # signup
  when false
    venue_selection
  end

end

# create_new_event(booking)
def create_new_event(book)
if booking == true
  puts "created"
  Gig.create(artist_id: self.id, venue_id:location.id)
  Gig.save
end
end

 # def show_venues
 #   Venue.location
 # end

#
# def run
#   greet
#   puts "which area would you like to find a gig? Enter a location:"
#   user_location = gets.chomp
#   Venue.find_by(location: user_location)
# end
