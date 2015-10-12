require 'yelp'

client = Yelp::Client.new(
  {
    consumer_key: "kYUtIL4_JaUTzbVXYYG4eA",
    consumer_secret: "9SA_nrOUDurOpJ8pjHXwf7y2DhQ",
    token: "iK8PukN8xRW4WDwemFrDlTiYwLbiPuep",
    token_secret: "o3x2afabAFd8M8eWCvL8GzLU14Y"
  }
)

response = client.search('San Francisco')
 
response.businesses.each do |business|
  if business.rating > 3
    puts "#{business.name}, #{business.rating}"
  end
end