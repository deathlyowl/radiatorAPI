class Station < ActiveRecord::Base
  validates :name,        :presence => true
  validates :description, :presence => true
  validates :shortcut,    :presence => true
  validates :genre,       :presence => true
  validates :url,         :format => URI::regexp(%w(http)), :uniqueness => true
end