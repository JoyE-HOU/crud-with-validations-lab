class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, presence: true,
        if: :released?
    validate :song_not_repeated_by_same_artist_or_year

    private
    def song_not_repeated_by_same_artist_or_year
        @errors.add(:base, "The song cannot be repeated by the same artist in the same year") if self.title == self.artist_name && self.release_year
    end
end
