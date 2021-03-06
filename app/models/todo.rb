class Todo < ActiveRecord::Base
  attr_accessible :created_by_id, :name, :project_id

  validates_presence_of :created_by_id, :name, :project_id
  validate :todo_owner_and_project_are_same

  belongs_to :user, foreign_key: :created_by_id
  belongs_to :project
  has_many :tasks

  private
    def todo_owner_and_project_are_same
      if self.project.owner_id != self.created_by_id
        errors.add(:created_by_id, "must be a project owner to create todos")
      end
    end

end
