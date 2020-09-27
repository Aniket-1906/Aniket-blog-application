class Post < ApplicationRecord
  is_impressionable
  belongs_to :author
end
