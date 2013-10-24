class Category
  ALL = [
      { id: 1, name: 'Мужественность',   url: '/img/menu/p01.png' },
      { id: 2, name: 'Женственность',    url: '/img/menu/p02.png' },
      { id: 3, name: 'Исцеление в паре', url: '/img/menu/p03.png' },
      { id: 4, name: 'Секс и близость',  url: '/img/menu/p04.png' },
      { id: 5, name: 'Благосостояние',   url: '/img/menu/p05.png' },
      { id: 6, name: 'Развитие вместе',  url: '/img/menu/p06.png' },
      { id: 7, name: 'Живые отношения',  url: '/img/menu/p07.png' }
  ]
  PREFIX = '/img/menu/'

  def self.all
    ALL
  end
end