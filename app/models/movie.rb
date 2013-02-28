require 'net/http' 
require 'uri'
require 'json'
class Movie < ActiveRecord::Base
  belongs_to :user
  attr_accessible :imdb, :media, :media_info, :seen, :user_id
end
