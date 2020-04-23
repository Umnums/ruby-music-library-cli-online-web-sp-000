require_relative './concerns/method.rb'
require_relative './artist.rb'

class Song

  attr_accessor :name, :artist, :genre
  @@all = []
  include Concerns::Methods::InstanceMethods
  extend Concerns::Findable, Concerns::Methods::ClassMethods

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(this)
    if this == nil
      return nil
    else
      @artist = this
      this.add_song(self)
    end
  end

  def genre=(genre)
    if genre == nil
      nil
    else
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.new_from_filename(file)
    name = file.split(" - ")
    new_obj = Song.new(name[1])
    new_obj.artist = Artist.find_or_create_by_name(name[0].strip)
    new_obj.genre = Genre.find_or_create_by_name(name[2].split(".mp3")[0].strip)
    new_obj
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end



end
#
#
# song1 = Song.create("The King of Carrot Flowers, Pt. One")
# song2 = Song.create("In the Aeroplane Over the Sea")
# print Song.find_or_create_by_name("other")
