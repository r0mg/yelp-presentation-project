require 'yelp'

client = Yelp::Client.new(
  {
    consumer_key: "XXXXXXXXXXXXXXXXX",
    consumer_secret: "XXXXXXXXXXXXXXXXX",
    token: "XXXXXXXXXXXXXXXXX",
    token_secret: "XXXXXXXXXXXXXXXXX"
  }
)

  continue = "y"
    
  puts "Where ARE you? (Enter a zipcode, neighborhood, city, etc.)"
  location = gets.chomp

  puts "What type of food would you like? Leave blank if you'd like us to choose ;)"
  food_type = gets.chomp
 results = client.search(location,{category_filter: 'restaurants'}, term: food_type, radius_filter: 405)
  
   
  array_of_businesses = results.businesses
  randomized_array = array_of_businesses.shuffle
  
  while continue == "y" && randomized_array.length > 0
    random_selection = randomized_array.pop
    puts
    puts "Congratulations! You're going to " + random_selection.name + "!"
    puts "Head to " + random_selection.location.display_address.first + " immediately!"
    puts
    puts "...or would you rather go somewhere else? Y/N"
    continue = gets.chomp.downcase
  end

  if continue == "y"
    puts "You're too picky! There are no more #{food_type} restaurants in your area."
  else
    puts "Enjoy!"
  end