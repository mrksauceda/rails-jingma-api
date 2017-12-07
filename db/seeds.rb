percent_discount = [
  "10%",
  "20%",
  "30%",
  "40%",
  "50%",
  "60%",
  "70%",
  "80%",
  "90%"
]

seed_description = [
  "this is great",
  "this is bad",
  "highly useful",
  "HUGE SAVINGS",
  "can't live without it",
  "best purchase ever!",
  "can't wait to use it",
  "totally regret it",
  "best deal ever!!!!"
]

seed_category = [
  "electronics",
  "food",
  "lifestyle",
  "automobiles",
  "travel",
  "leisure",
  "hotel",
  "investment",
  "groceries"
]

seed_photos = [
  "https://blogs-images.forbes.com/gordonkelly/files/2017/04/iDrop-News-Exclusive-iPhone-8-Image-6.jpg",
  "http://i.ebayimg.com/00/s/MzQyWDUwMA==/z/RQQAAOxyaTxTVhgE/$_35.JPG?set_id=2",
  "https://sites.google.com/a/springboro.org/sh/_/rsrc/1468859464760/dirty-shoes/dirtyshoes.jpg",
  "https://cdn.vox-cdn.com/thumbor/1lkbiwsmSbovu-HAyjWeZTcGQo8=/0x0:1920x1280/1200x800/filters:focal(807x487:1113x793)/cdn.vox-cdn.com/uploads/chorus_image/image/57340051/apples_2811968_1920.0.jpg",
  "https://latestautocar.com/wp-content/uploads/2017/06/Cheap-Expensive-Sports-Cars-Pictures-with-New-Collection-of-Expensive-Sports-Cars-Pictures-Latest.jpg",
  "https://cdn.shopify.com/s/files/1/0384/5081/products/pl440-3468-orange_large.jpg?v=1422119878",
  "https://www.propertyobserver.com.au/images/2017/05/24/retail-holding-bags-july7--breakout.jpg"
]


require 'faker'

User.destroy_all
Item.destroy_all

user = []
item = []

User.create!(
    email: "admin@gmail.com",
    password: 123123
    )

10.times do
  user << User.create!(
    email: Faker::Internet.email,
    password: 123123
    )
end


30.times do Item.create!(
  price: rand(10...3000),
  discount: percent_discount.sample,
  description: seed_description.sample,
  image_url: seed_photos.sample,
  category: seed_category.sample,
  is_private: true,
  user: User.all.sample,
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude
  )
end
