require 'pry'

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.find_all {|song|song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.map{|song|puts song.name}
    end

    def self.find_or_create_by_name(string)
        if found_artist = all.find do |artist|
            artist.name == string
            # return artist
            end
            found_artist
        else 
            return self.new(string)
        end
    end
end