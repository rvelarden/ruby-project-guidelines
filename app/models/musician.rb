class Musician < ActiveRecord::Base
    has_many :contracts
    has_many :gigs, through: :contracts

    def update_name(new_name)
        self.update(name: new_name)
    end
    def update_instrument(new_instrument)
        self.update(instrument: new_instrument)
    end
    def update_price(new_price)
        self.update(price: new_price)
    end
    def update_city(new_city)
        self.update(city: new_city)
    end
    def update_genre(new_genre)
        self.update(genre: new_genre)
    end
    def go_active
        self.update(active: 1)
    end
    def go_inactive
        self.update(active: 0)
    end

    def is_active? #maybe not necessary?
        self.active
    end

    # def self.musician_match(city, genre, instrument)
    #     Musician.where(city: city, genre: genre, instrument: instrument)
    # end --> maybe refactor all this at some point

    def self.price_asc(city, genre, instrument)
        Musician.where(city: city, genre: genre, instrument: instrument).order(:price)
    end

    def self.price_desc(city, genre, instrument)
        Musician.where(city: city, genre: genre, instrument: instrument).order(price: :desc)
    end

    def self.rating_desc(city, genre, instrument)
        Musician.where(city: city, genre: genre, instrument: instrument).order(rating: :desc)
    end

    def self.rating_asc(city, genre, instrument)
        Musician.where(city: city, genre: genre, instrument: instrument).order(:rating)
    end
        

end