class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

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


  def note_contents=(contents)
    contents.each do |content|
      if content != ''
        note = Note.create(content: content)

     # notes.split.reject(&:empty?)
     # if notes.split.includes?(" ")
     #   nil
     # else
      self.notes << note
      end

   # Note.create(content: content, song_id: self.id)

    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
