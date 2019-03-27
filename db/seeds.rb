Artist.destroy_all
Venue.destroy_all
Gig.destroy_all

blink182 = Artist.create(name: "blink182", bio: "blah blah blah blah")
migos = Artist.create(name: "migos", bio: "blah blah blah blah")
jay_z = Artist.create(name: "jay-z", bio: "blah blah blah blah")
live_well = Artist.create(name: "live_well", bio: "blah blah blah blah")
drake = Artist.create(name: "drake", bio: "blah blah blah blah")

madison_square = Venue.create(name: "madison_square", location: "NYC", open: "7pm", close: "4am", prices:44.99 )
barclays = Venue.create(name: "barclays", location: "BK", open: "6pm", close: "2am", prices:35.00)
sleep_no_more = Venue.create(name: "sleep_no_more", location: "NYC", open: "5pm", close: "1am", prices:25.00)
chelsea_piers = Venue.create(name: "chelsea_piers" , location: "NYC", open: "9pm", close: "4am", prices: 30.00 )


gig1 = Gig.create(artist_id: jay_z.id, venue_id: madison_square.id)
gig2 = Gig.create(artist_id: migos.id ,venue_id: sleep_no_more.id)
gig3 = Gig.create(artist_id: drake.id, venue_id: barclays.id)
