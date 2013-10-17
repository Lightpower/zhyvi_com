class Category
  ALL = [
      { id: 1, name: 'Мужественность',   url: 'p01.jpg' },
      { id: 2, name: 'Женственность',    url: 'p02.jpg' },
      { id: 3, name: 'Исцеление в паре', url: 'p03.jpg' },
      { id: 4, name: 'Секс и близость',  url: 'p04.jpg' },
      { id: 5, name: 'Благосостояние',   url: 'p05.jpg' },
      { id: 6, name: 'Развитие вместе',  url: 'p06.jpg' },
      { id: 7, name: 'Живые отношения',  url: 'p07.jpg' }
  ]
  PREFIX = '/img/menu/'

  def self.all
    ALL
  end
end