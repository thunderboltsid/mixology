class Listing < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "missing.jpg"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  else
    has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "missing.jpg",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  end
  validates :name, :description, :liqperc, :recipe, :liqours, :mixers, :category, presence: true
  validates :liqperc, numericality: {greater_than_or_equal_to: 0}
  validates_attachment_presence :image
  belongs_to :user

  searchable do
    text :name, :description, :recipe, :category, :mixers, :liqours, :liqperc
  end
  acts_as_votable
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
