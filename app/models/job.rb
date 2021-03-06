class Job < ActiveRecord::Base
  acts_as_list
  
  has_many :questions
  has_many :answers, :through => :questions
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :answers 
  
  attr_writer :tag_names
  after_save :assign_tags 
  
  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  private
  
  def assign_tags
    if @tag_names
       self.tags = @tag_names.split(/\s+/).map do |name|
         Tag.find_or_create_by_name(name)
       end
    end
  end
end
