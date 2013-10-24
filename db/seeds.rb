# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[User, FileLink, Event, Feedback].map { |klass| klass.delete_all }

admin = User.create(username: 'admin', password: '123456', password_confirmation: '123456', role: 'Admin')
user  = User.create(username: 'test',  password: '123456', password_confirmation: '123456')

puts "Users are added with id: [#{admin.id}, #{user.id}]"

images = FileLink.create([
    {type: 'FileLink', url: 'http://klads.org.ua/044/pic/1_1.png', user_id: admin.id},
    {type: 'FileLink', url: 'http://klads.org.ua/044/pic/5_4.png', user_id: admin.id}
])

puts "#{images.size} images are added"

events = Event.create([
    {title: 'Мега-событие', preview: 'Это будет МЕГА-событие, не пропустите его!', data: 'Текст события, бла-бла-бла и всё такое', start_at: Time.now - 10.days, user_id: admin.id},
    {title: 'Просто событие', preview: 'Важное событие, заведённое для теста', data: 'Текст этого события, все дела',   start_at: Time.now + 7.days, user_id: admin.id}
])

puts "#{events.size} events are added"

feedbacks = Feedback.create([
  {event_id: events.first.id, user_id: user.id, file_link_id: images.first.id, data: 'Всё было супер', selected: true},
  {event_id: events.first.id, user_id: user.id, file_link: images,last.id, data: 'Отзыв 2', selected: true},
  {event_id: events.first.id, user_id: user.id, data: 'Отзыв 3'},
  {event_id: events.first.id, user_id: user.id, data: 'Отзыв 4'},
  {event_id: events.first.id, user_id: user.id, data: 'Последний отзыв'}
])

puts "#{feedbacks.size} feedbacks are added"
