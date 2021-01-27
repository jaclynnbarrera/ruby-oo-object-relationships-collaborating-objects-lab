require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(artist_name)
        artist_instance = Artist.find_or_create_by_name(artist_name)
        artist_instance.add_song(self)
    end

    def self.new_by_filename(string)
        song = string.split(" - ")[1]
        artist = string.split(" - ")[0]
        new_song = self.new(song)
        new_song.artist_name=(artist)
        new_song
    end
end
