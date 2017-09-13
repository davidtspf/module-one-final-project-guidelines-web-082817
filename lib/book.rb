class Book < ActiveRecord::Base
  has_many :book_genres
  has_many :genres, :through => :book_genres



end
