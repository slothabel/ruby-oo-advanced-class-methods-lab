require 'pry'
class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)    
    song_w_name = self.new
    song_w_name.name = name
    song_w_name
  end

  def self.create_by_name(name)

    create_name = self.new
    create_name.name = name
    create_name.save
    create_name
  end

  def self.find_by_name(name)

    self.all.find{|i| i.name == name}
    
  end

  def self.find_or_create_by_name(song)
    found_song = Song.find_by_name(song)
    if found_song 
      found_song
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by do |a|
    a.name
    end
  end

  def self.new_from_filename(file)
    split_file = file.split(" - ")
    artist_name = split_file[0]
    song_name = split_file[1].chomp(".mp3")
    new_file = self.new
    new_file.name = song_name
    new_file.artist_name = artist_name
    new_file

  end

  def self.create_from_filename(file)
     #binding.pry
     splitted_f = file.split(" - ")
     artist_name_2 = splitted_f[0]
     song_name_2 = splitted_f[1].chomp(".mp3")
     #file has been split up
     file_creation = self.create_by_name(file)
     #new instance is saved
     file_creation.name = song_name_2
     file_creation.artist_name = artist_name_2
     file_creation

  end

  def self.destroy_all
    @@all.clear
  end

  end

#song_1 = Song.find_or_create_by_name("songname")
#song_2 = Song.find_or_create_by_name("songname2")
#song_3 = Song.find_or_create_by_name("songname3")
#song_4 = Song.find_or_create_by_name("songname4")

