class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :project_users
  has_many :projects, through: :project_users
  has_many :projects, foreign_key: :owner_id

  # has_many :todos, foreign_key: :owner_id

  has_many :tasks, foreign_key: :created_by_id
  has_many :tasks, foreign_key: :assigned_to_id

end
