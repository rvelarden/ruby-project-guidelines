class Contract < ActiveRecord::Base
    belongs_to :gigs
    belongs_to :musicians
end