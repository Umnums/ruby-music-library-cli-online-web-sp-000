class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    @library = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    if input == 'list songs'
      list_songs
    elsif input == 'list artists'
      list_artists
    elsif input == 'list genres'
      list_genres
    elsif input == 'list genre'
    end
    while input != "exit"
      call
    end
  end

  def list_songs
    array = Song.all.sort{|a,b| a.name <=> b.name}
    # print array
    array.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    array = Artist.all.sort{|a,b| a.name <=> b.name}
    # print array
    array.each_with_index do |pers, index|
      puts "#{index + 1}. #{pers.name}"
    end
  end


end
