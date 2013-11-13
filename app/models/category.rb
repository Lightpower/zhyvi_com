class Category
  ALL = [
      { id: 1, name: 'Мужественность',   url: '/img/menu/p01.jpg' },
      { id: 2, name: 'Женственность',    url: '/img/menu/p02.jpg' },
      { id: 3, name: 'Исцеление в паре', url: '/img/menu/p03.jpg' },
      { id: 4, name: 'Секс и близость',  url: '/img/menu/p04.jpg' },
      { id: 5, name: 'Благосостояние',   url: '/img/menu/p05.jpg' },
      { id: 6, name: 'Развитие вместе',  url: '/img/menu/p06.jpg' },
      { id: 7, name: 'Живые отношения',  url: '/img/menu/p07.jpg' }
  ]
  PREFIX = '/img/menu/'

  def self.all
    ALL
  end

  def self.find(id)
    ALL.select { |i| i[:id] == id.to_i }.first
  end
end