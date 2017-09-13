require 'pry'

class CommandLineInterface

  def greet
    puts "Welcome to BookFinder, the command line solution for your book-finding needs!"
  end

  def gets_user_input
    puts "We can help you find which books are available?"
    puts "Enter a book title to get started:"
    title = gets.chomp

    if Book.find_by(title: title)
      title
    else
      gets_user_input
    end
    
  end

  def find_book(title)
    Book.find_by(title: title)
  end

  def find_genres(book)
    book.genres
  end

  def show_genres(genres)
    collection = []
    genres.each do |genre|
      collection << genre[:the_genre]
    end
    print "Genre(s): "
    puts collection.join(", ")
  end

  def run
    greet
    title = gets_user_input
    book = find_book(title)
    genres = find_genres(book)
    show_genres(genres)
  end

end
