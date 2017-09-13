

Book.create(title: "Great Expectations", author: "Charles Dickens", year: 1861)
Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1924)
Book.create(title: "The Ruby Programming Language", author: "Yukihiro Matsumoto", year: 2008)
Book.create(title: "Manwhore", author: "Katy Evans", year: 2015)
Book.create(title: "The Corrections", author: "Jonathan Franzen", year: 2001)
Book.create(title: "Cryptonomicon", author: "Neal Stephenson", year: 1999)


Genre.create(the_genre: "drama")
Genre.create(the_genre: "comedy")
Genre.create(the_genre: "technology")
Genre.create(the_genre: "romance")
Genre.create(the_genre: "sci-fi")
Genre.create(the_genre: "history")
Genre.create(the_genre: "tragedy")

BookGenre.create(book_id: 1, genre_id: 1)
BookGenre.create(book_id: 1, genre_id: 7)
BookGenre.create(book_id: 2, genre_id: 1)
BookGenre.create(book_id: 2, genre_id: 4)
BookGenre.create(book_id: 3, genre_id: 3)
BookGenre.create(book_id: 4, genre_id: 4)
BookGenre.create(book_id: 4, genre_id: 7)
BookGenre.create(book_id: 5, genre_id: 1)
BookGenre.create(book_id: 6, genre_id: 6)
BookGenre.create(book_id: 6, genre_id: 5)
