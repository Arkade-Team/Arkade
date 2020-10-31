class Wiki < ApplicationRecord
    has_many :tabs
    has_many :readingtimes
end
