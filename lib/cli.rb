#!/usr/bin/env ruby

# greet new user with a desciption of the app
def greet
  $prompt = TTY::Prompt.new(symbols: {pointer: '>'}, cycle: true)
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
# user enters artist sudo name and is created` in our database
def create_user
  name = $prompt.ask('What is your name?', default: "artist_name")
  puts "Welcome #{name}!"
  @new_artist = Artist.create(name: name, bio: "bio here")
  # binding.pry
end
# drop down menu that give the user options to Create a gig, Update+delete gig, and exit app


def user_menu

  choose = $prompt.select('choose from the menu below', %w(list_of_venues your_venues update_profile delete_venue exit ))
  system "clear"
  while choose != "exit"
    if  choose == "list_of_venues"
      venue_selection
      book
    elsif choose == "your_venues"
      puts @new_artist.artist_gigs
      user_menu
    elsif choose == "update_profile"
      update_profile
    elsif choose == "delete_venue"
      delete_gig
    end
  end
close_app
end

def venue_selection
  system "clear"
  @selected_venue = $prompt.select("choose your venue location:") do |menu|
      Venue.all.each do |venue|
        menu.choice venue.name, venue
      end
    end
end
# def venue_hash
#   hash = {}
#   @new_artist.venues.each do |venue|
#     hash[venue] = venue.name
#   end
#   hash
# end
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
def update_profile
  ## Asking user what they'd like to update and store value of selection into
  ## variable to_update
  to_update = $prompt.select('update profile') do |menu|
                menu.choice "artist name", 1
                menu.choice "bio", 2
                menu.choice "exit", 3
              end
  # ask's the user for information about themselves to update
  case to_update

    when 1
      name = $prompt.ask("What is your artist?", default: @new_artist.name) do |q|
        q.required true
      end
      # binding.pry
      # update_name = Artist.find_by(id: @new_artist.id)
      # binding.pry
      @new_artist.update(name: name)
      # update_name.save
    when 2
      bio = $prompt.ask('What do you want your fan to know about you?') do |t|
        t.required true
      end
      
      bio.update
    when 3
      user_menu

  end

end
  # @new_artist.update( )


def delete_gig
  # finds a specific gig and then destroy
  to_delete = $prompt.select('Cancel a show', @selected_venue).each do |t|
    t.choice
  end

  to_delete.destroy

  user_menu
end

def close_app
  abort("See you at the show!")
end
 # create_new_event(book)
#   if booking == true
#      puts "created"
#     Gig.create(artist_id: self.id, venue_id:location.id)
#     Gig.save
#   end

 def run_program
   greet
   create_user
   user_menu
   book
 end
