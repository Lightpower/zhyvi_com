# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(username: 'admin', password: '123456', password_confirmation: '123456', role: 'Admin')
user  = User.create(username: 'test',  password: '123456', password_confirmation: '123456')

images = ImageLink.create([
    {url: 'http://klads.org.ua/044/1_1.png', user_id: admin.id},
    {url: 'http://klads.org.ua/044/5_4.png', user_id: admin.id}
])

events = Event.create([
    {title: 'Мега-событие', preview: 'Это будет МЕГА-событие, не пропустите его!', data: 'Текст события, бла-бла-бла и всё такое', start_at: Time.today - 10.days, user_id: admin.id},
    {title: 'Просто событие', preview: 'Важное событие, заведённое для теста', data: 'Текст этого события, все дела',   start_at: Time.today + 7.days, user_id: admin.id}
])

feedbacks = Feedback.create([
  {event_id: events.first.id, user_id: user.id, file_id: images.first.id, data: 'Всё было супер'},
  {event_id: events.first.id, user_id: user.id, data: 'Отзыв 2'},
  {event_id: events.first.id, user_id: user.id, data: 'Отзыв 3'},
  {event_id: events.first.id, user_id: user.id, data: 'Отзыв 4'},
  {event_id: events.first.id, user_id: user.id, data: 'Последний отзыв'}
])

