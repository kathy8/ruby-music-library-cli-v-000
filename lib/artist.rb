
class Artist
attr_accessor :name, :songs
@@all = []
extend Concerns::Findable



def initialize(name)
@name = name
@songs = []
end

def self.all
@@all
end

def self.destroy_all
all.clear
end

def save
@@all << self
end

def self.create(name)
artist = Artist.new(name)
@@all << artist
artist
end

def songs
@songs
end

def add_song(song)
song.artist = self unless !!song.artist
@songs << song unless @songs.include?(song)
  end

def genres
@songs.collect {|song| song.genre}.uniq
end

end
