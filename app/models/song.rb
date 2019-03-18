# genre_name=
# sets the genre to the genre of the specified name (FAILED - 4)
# genre_name
# returns the genre name (FAILED - 5)
# artist_name=
# sets the artist to the artist of the specified name (FAILED - 6)
# artist_name
# returns the artist name (FAILED - 7)
# note_contents
# returns the content of all notes as an array (FAILED - 8)
# note_contents=
# sets notes for a song (FAILED - 9)
# adds to existing notes (FAILED - 10)
# ignores blank notes (FAILED - 11)

# class Post < ActiveRecord::Base
#   def category_name=(name)
#     self.category = Category.find_or_create_by(name: name)
#   end

#   def category_name
#      self.category ? self.category.name : nil
#   end
# end

# class Category < ActiveRecord::Base
#   def post_ids=(ids)
#     ids.each do |id|
#       post = Post.find(id)
#       self.posts << post
#     end
#   end
# end

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      if note != ""
        new_note = Note.create(content: note)
      self.notes << new_note
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content 
    end
  end
end



