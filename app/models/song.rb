class Song < ActiveRecord::Base
  # add associations here
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

  def note_contents
    self.notes ? self.notes.map {|note| note.content} : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        note =  Note.find_or_create_by(content: content)
        self.notes << note
      elsif
        nil
      end
    end
  end
end
