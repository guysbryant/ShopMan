# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "test", username: "test", password: "test123", address: "123 test", phone_number: 1234567)
products = [
  {
    name: "Watch",
    description: "Tell the time",
    part_number: "wt1"
  },
  {
    name: "Headpohones",
    description: "Listen to the music",
    part_number: "hp1"
  },
  {
    name: "TV",
    description: "Watch it",
    part_number: "tv23"
  },
  {
    name: "Dry Erase Board",
    description: "Take some notes",
    part_number: "deb33"
  },
  {
    name: "Glasses",
    description: "Better, clearer, vision",
    part_number: "gl99"
  },
  {
    name: "Speaker",
    description: "Share the sound",
    part_number: "spk00"
  },
  {
    name: "Lightbulb",
    description: "Lamps don't work without it",
    part_number: "lb19"
  },
  {
    name: "Fan",
    description: "Stay cool",
    part_number: "f22"
  },
  {
    name: "Laptop",
    description: "Code and play",
    part_number: "lp07"
  },
  {
    name: "Bag",
    description: "Carry the world",
    part_number: "bag"
  }
].each{ |p| Product.create(p) }

customers = [
  {
    name: "Titan Idustries",
    address: "227 Titan Ave",
    contact_name: "Susan",
    phone_number: "864-227-2828",
    email: "susan@titan.com"
  },
  {
    name: "IlumaNation",
    address: "119 Bright Way",
    contact_name: "David",
    phone_number: "937-119-7234",
    email: "sales@inat.org"
  },
  {
    name: "Soft-Wear",
    address: "57 Comfy Blvd",
    contact_name: "Donna",
    phone_number: "913-817-5898",
    email: "purchasing@comfy.com"
  }
].each{ |c| Customer.create(c) }

3.times{ Customer.all.each{ |c| SalesOrder.create(customer: c) }}


# sales_order_lines << SalesOrderLine.create(product: Product.all.first, qty: 23, price: 9)
i = 0
while i < 10
  j = 0
  while j < 8
    q = i + 2
    p = i + 1 * 10
    SalesOrder.all[j].sales_order_lines << SalesOrderLine.create(product: Product.all[i], qty: q, price: p)
    j += 1
  end
  i += 1
end
