class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'メンズ' }, ...
  ]
end
