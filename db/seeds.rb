require "open-uri"
require "yaml"

Review.destroy_all
Book.destroy_all


file = "https://raw.githubusercontent.com/rodloboz/lw-fullstack/master/goodreads/data/books.yml"
sample = YAML.load(open(file).read)


puts 'Creating books...'
books = {}
sample["books"].each do |book|
  books[book["slug"]] = Book.create!(title: book["title"],description: book["description"],image_url: book["image_url"])
end


puts 'Creating reviews...'
sample["reviews"].each do |review|
  book = books[review["book_slug"]]
  Review.create!(rating: review["rating"], content: review["content"], book: book)
end


puts 'Finished!'
