class Minute < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true
  validates :chairman, presence: true
  validates :department, presence: true
   validates :location, presence: true
   validates :participant, presence: true
   validates :agenda, presence: true
   validates :nummer, presence: true
   validates :subject, presence: true
   validates :action, presence: true
   validates :responsible, presence: true
   validates :duedate, presence: true
   validates :status, presence: true
   belongs_to :user
end
