class Gig < ActiveRecord::Base
    has_many :contracts
    has_many :musicians, through: :contracts

end