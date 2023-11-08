class User < ApplicationRecord
  has_paper_trail
  has_many :todos
end