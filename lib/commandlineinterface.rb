require 'pry'

class CommandLineInterface

  def greet
    puts "Welcome to MyBooks!"
  end

  def gets_user_input
    puts "We can help you find which books are available."
    puts "Enter a book title to get started:"
    title = gets.chomp

    if find_book(title)
      title
    else
      gets_user_input
    end

  end

  def find_book(title)
    Book.all.find do |book|
      book.title.downcase == title.downcase
    end
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

  def find_a_book_program
    continue = "y"
    while continue == "y"
      title = gets_user_input
      book = find_book(title)
      genres = find_genres(book)
      show_genres(genres)
      puts "Would you like to look up another book? (y/n)"
      continue = gets.chomp
    end
  end

  def create_a_book
    puts "What is the title of the book?"
    title = gets.chomp
    puts "Who is the author of the book?"
    author = gets.chomp
    puts "What year was the book published?"
    year = gets.chomp
    Book.create(title: title, author: author, year: year)
    puts "Yay! Your book is now in the database."
  end

  def update_a_book
    puts "What is the current title of the book?"
    title = gets.chomp
    book = Book.find_by(title: title)

    puts "What do you wish to update?"
    puts "Title (t), Author (a), Year (y)"
    choice = gets.chomp
    if choice == "t"
      puts "What do you want the new title to be?"
      new_title = gets.chomp
      book.update(title: new_title)
      puts "Woohoo! The title has been updated!"
    elsif choice == "a"
      puts "Who is the new author?"
      new_author = gets.chomp
      book.update(author: new_author)
      puts "Woohoo! The author has been updated!"
    else
      puts "What is the new year?"
      new_year = gets.chomp
      book.update(year: new_year)
      puts "Woohoo! The year has been updated!"
    end
  end

  def delete_a_book
    puts "What is the title of the book you would like to delete?"
    title_to_delete = gets.chomp
    book_to_delete = Book.find_by(title: title_to_delete)
    book_to_delete.destroy
    puts "#{title_to_delete} has been deleted. :("
  end


  def crud_program
    puts "CRUD is an acronym for: Create (c), Read (r), Update (u) and Delete (d)."
    puts "We can do any of these to your books."
    puts "What do you want to do?"
    which_crud = gets.chomp
    if which_crud == "c"
      create_a_book
    elsif which_crud == "r"
      find_a_book_program
    elsif which_crud == "u"
      update_a_book
    else
      delete_a_book
    end
  end

  def run
    greet
    find_or_crud = ""
    while find_or_crud != "q"
      puts "Do you want to find a book (1) or CRUD (2), or quit (q)?"
      find_or_crud = gets.chomp
      if find_or_crud == "1"
        find_a_book_program
      elsif find_or_crud == "2"
        crud_program
      else
        exit
      end
    end
  end

end
