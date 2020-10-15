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
    @@all << self.new
    @@all.last
  end 

  def self.new_by_name(name)
   song = self.new
   song.name = name
   @@all << song
   song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end 

  def self.find_by_name(title)
   self.all.find{|song| song.name == title }
  end 

  def self.find_or_create_by_name(title)
   result = self.find_by_name(title)
    result ? result : self.create_by_name(title)
  end 

  def self.alphabetical 
    self.all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_array = file_name.split(Regexp.union(' - ', '.mp3'))
    new_song = self.new
    new_song.artist_name, new_song.name = song_array[0], song_array[1]
    new_song
  end 

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
    self.all.last
  end

  def self.destroy_all
    self.all.clear
  end 


end
