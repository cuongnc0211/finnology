# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "create admin"

email = Rails.application.credentials.dig(:seed, :admin_email)
pw = Rails.application.credentials.dig(:seed, :admin_password)

Admin.create(email: email, password: pw) unless Admin.find_by(email: email)

puts "generate sample articles"

20.times do |n|
  title = Faker::Lorem.sentence
  tags = (1..3).to_a.map { |i| Faker::Science.tool }.join(', ')

  Article.create(
    title: title,
    subtitle: Faker::Lorem.paragraph(sentence_count: 2),
    content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
    slug: title.split(' ').join('-'),
    status: %w[drafting publish].sample,
    tag_list: tags
  )
end
