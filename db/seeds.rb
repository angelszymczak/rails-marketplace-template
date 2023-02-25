products = Product.create([
  { title: 'iPhone', description: 'used', price: 2000 },
  { title: 'Samsung', description: 'new', price: 6000 },
])
puts "Created #{products.count} products"
