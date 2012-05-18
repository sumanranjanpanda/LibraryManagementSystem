class Book < ActiveRecord::Base
validates_presence_of :name,:message=>"^Name can't be blank"
validates_presence_of :author, :message=>"^author can't be blank"
validates_presence_of :edition,:message=>"^edition can't be blank"
validates_presence_of :status,:message=>"^status can't be blank"
validates_presence_of :total,:message=>"^total can't be blank"
validates_uniqueness_of:sl_no, :message=>"^sl_no can't be blank",:allow_blank=>true
end
