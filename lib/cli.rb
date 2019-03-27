#!/usr/bin/env ruby

# greet new user with a desciption of the app
def greet
  $prompt = TTY::Prompt.new
  system "clear"

  puts 'Welcome to gig_finder, the best resource for finding your next gig!'
  puts "______________________________¶¶¶¶¶¶
_____________________________¶¶¶¶¶¶¶¶¶
____________________________¶¶¶¶¶¶¶¶¶¶
____________________________¶¶¶¶¶¶¶¶¶¶¶
____________________________¶¶¶¶¶¶¶¶¶¶
_____________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶
___________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶__________¶¶¶¶
__________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_______¶¶¶¶¶¶
_________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶______¶¶¶¶¶
________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_____¶¶¶
________________¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶___¶¶¶
_______________¶¶¶¶__¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶
_______________¶¶¶___¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
______________¶¶¶____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
______________¶¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶
___________¶¶¶¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶
___________¶¶_¶___¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
___________¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
__________________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_____________¶¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
__________¶¶¶_______¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_________¶__________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_________¶_________¶¶¶¶¶¶¶¶____¶¶¶¶¶¶¶¶
__________¶________¶¶¶¶¶¶¶______¶¶¶¶¶¶¶¶
___________¶______¶¶¶¶¶¶¶_________¶¶¶¶¶¶
____________¶____¶¶¶¶¶¶¶__________¶¶¶¶¶¶
_____________¶__¶¶¶¶¶¶¶__________¶¶¶¶¶¶
_______________¶¶¶¶¶¶¶___________¶¶¶¶¶
______________¶¶¶¶¶¶¶_¶¶¶_______¶¶¶¶¶¶
______________¶¶¶¶¶¶_____¶______¶¶¶¶¶
_____________¶¶¶¶¶¶______¶______¶¶¶¶¶
_____________¶¶¶¶¶_______¶_____¶¶¶¶¶¶
____________¶¶¶¶¶_______¶¶_____¶¶¶¶¶¶
___________¶¶¶¶¶¶______¶¶______¶¶¶¶¶¶
___________¶¶¶¶¶¶______¶_______¶¶¶¶¶¶¶¶
____________¶¶¶¶______¶____________¶¶¶¶¶¶
______¶¶¶¶¶¶_¶¶¶_¶¶¶¶¶
¶¶¶¶¶¶_______¶¶¶"
end
# user enters artist sudo name and is created in our database
def create_user
  name = $prompt.ask('What is your name?', default: "artist_name")
  puts "Welcome #{name}!"
  @new_artist = Artist.create(name: name)
end
# drop down menu that give the user options to Create a gig, Update+delete gig, and exit app
def user_menu
  system "clear"
choose = $prompt.select('choose from the menu below', %w(list_of_venues your_venues exit ))

  case choose

  when "list_of_venues"
    venue_selection
  when "your_venues"
    @new_artist.artist_venues

  when "exit"
    close_app
  end
end

def venue_selection
  system "clear"
  @selected_venue = $prompt.select("choose your venue location:") do |menu|
      Venue.all.each do |venue|
        menu.choice venue.name, venue
      end
    end
end

def book
  system "clear"
  venue_info = Venue.where(name: @selected_venue.name)

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
    puts "BOOKED!"
    Gig.create(artist_id: @new_artist.id, venue_id: @selected_venue.id )
    user_menu
  when false
    venue_selection
  end

end
def close_app
  abort("See you at the show!")
end
# create_new_event(booking)
def create_new_event(book)
  if booking == true
     puts "created"
    Gig.create(artist_id: self.id, venue_id:location.id)
    Gig.save
  end
end





 def run_program
   greet
   create_user
   user_menu
   book

 end
