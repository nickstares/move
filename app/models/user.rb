class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  has_many :follower_relationships, foreign_key: 'follower_id', class_name: 'Follow', dependent: :destroy
  has_many :followed_relationships, foreign_key: 'followed_id', class_name: 'Follow', dependent: :destroy

  has_many :followers, through: :followed_relationships
  
  has_many :followed_users, through: :follower_relationships, source: :followed

  def follow!(other_user)
    # puts "Current User: #{other_user.inspect}"
  	 follower_relationships.create!(followed_id: other_user.id)
  end
  
  def followed
    Follower
  end

  def self.search(query)
    where("username like ? or email like ?", "%#{query}%", "%#{query}%") 
  end

end
