require 'pry'

class CommandLineInterface

  def print_books
    Book.all.each do |book|
      puts "#{book.title}\t #{book.author}\t #{book.year}"
    end
  end

  def print_genres
    Genre.all.each do |genre|
      puts "#{genre.id}:\t #{genre.the_genre}"
    end
  end

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

  def update_title(book)
    puts "What do you want the new title to be?"
    new_title = gets.chomp
    book.update(title: new_title)
    puts "Woohoo! The title has been updated!"
  end

  def update_author(book)
    puts "Who is the new author?"
    new_author = gets.chomp
    book.update(author: new_author)
    puts "Woohoo! The author has been updated!"
  end

  def update_year(book)
    puts "What is the new year?"
    new_year = gets.chomp
    book.update(year: new_year)
    puts "Woohoo! The year has been updated!"
  end

  def update_genre(book, title)
    puts "Which genre # applies to #{title}?"
    print_genres
    genre_id = gets.chomp
    book_id = book.id
    BookGenre.create(book_id: book_id, genre_id: genre_id)
    puts "#{title} loves this genre!"
  end

  def update_a_book
    print_books
    puts "What is the current title of the book?"
    title = gets.chomp
    book = find_book(title)

    puts "What do you wish to update?"
    puts "Title (t), Author (a), Year (y), Genre (g)"
    choice = gets.chomp
    if choice == "t"
      update_title(book)
    elsif choice == "a"
      update_author(book)
    elsif choice == "y"
      update_year(book)
    else
      update_genre(book, title)
    end
  end

  def delete_a_book
    print_books
    puts "What is the title of the book you would like to delete?"
    title = gets.chomp
    book = find_book(title)
    book.destroy
    puts "#{title} has been deleted. :("
  end

  def delete_a_genre
    print_books
    puts "What is the title of the book whose genre you would like to delete?"
    title = gets.chomp
    book = find_book(title)

    puts "Here are the genres that are assigned to this book. Pick one by number:"
    book.genres.each do |genre|
      puts "#{genre.id}. #{genre.the_genre}"
    end
    genre_number = gets.chomp
    bookgenre = BookGenre.find_by(genre_id: genre_number)
    binding.pry
    bookgenre.destroy
    puts "The genre for #{title} has been deleted."
  end

  def delete_a_book_or_genre
    puts "Would you like to delete a book (b), or the genre (g) a book is in?"
    book_or_genre = gets.chomp
    if book_or_genre == "b"
      delete_a_book
    else
      delete_a_genre
    end
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
      delete_a_book_or_genre
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
