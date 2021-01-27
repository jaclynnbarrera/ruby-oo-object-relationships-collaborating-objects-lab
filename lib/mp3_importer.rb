require 'pry'

class MP3Importer
    attr_accessor :path, :song

    def initialize(filepath)
        @path = filepath
    end

    def files
        Dir.children(path)
        # binding.pry
    end

    def import
        files.each do |song|
            Song.new_by_filename(song)
        end
    end
end

