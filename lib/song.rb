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
    if self.all.include?(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
       # binding.pry

  end

end
