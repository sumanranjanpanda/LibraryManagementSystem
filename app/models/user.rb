class User < ActiveRecord::Base

validates_presence_of :name,:message=>"^Name can't be blank"
validates_presence_of :occupation, :message=>"^Occupation can't be blank"
validates_presence_of :gender,:message=>"^Gender can't be blank"
validates_presence_of :age,:message=>"^Age can't be blank"
validates_presence_of :email,:message=>"^Email can't be blank"
validates_presence_of :mobile,:message=>"^Mobile no. can't be blank"
validates_presence_of :password,:message=>"^Password can't be blank"
validates_presence_of :password_confirmation,:message=>"^Confirm Password can't be blank"
validates_uniqueness_of:email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:allow_blank=>true
validates_length_of :mobile, :is => 10,:allow_blank=>true
validates_numericality_of :age, :only_integer => true,:allow_blank=>true
validates_numericality_of :mobile, :only_integer => true,:allow_blank=>true
validates_length_of :password, :in => 6..12,:allow_blank=>true
validates_confirmation_of :password,:allow_blank=>true,:message=>"^Confirm password must same as password"

#validates_attachment_presence :photo,:message=>"^upload your photo.."
#validates_attachment_content_type :photo, :content_type => 'image/jpeg'
has_attached_file :photo,:styles => { :thumb=> "100x100",:small  => "300x300>" }

end
