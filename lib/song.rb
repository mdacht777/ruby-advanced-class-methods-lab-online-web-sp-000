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
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.destroy_all
    @@all=[]
  end

  def self.alphabetical
    @@all.sort_by {|i| i.name}
  end

  def self.new_from_filename(filename)
    noext=filename.split(".mp3")[0]
    song = self.new
    song.artist_name=noext.split(" - ")[0]
    song.name=noext.split(" - ")[1]
    @@all << song
    song
  end

  def self.create_from_filename(filename)
    noext=filename.split(".mp3")[0]
    song = self.new
    song.artist_name=noext.split(" - ")[0]
    song.name=noext.split(" - ")[1]
    @@all << song
    song
  end
end
