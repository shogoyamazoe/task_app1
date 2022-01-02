class Post < ApplicationRecord
    validates :title, presence: true
    validates :startdate, presence: true
    validates :enddate, presence: true
    
    validate :start_end_check
   
  def start_end_check
    errors.add(:enddate, "は開始日より前の日付は登録できません。") unless 
    if self.startdate && self.enddate != nil
         self.startdate < self.enddate 
    end
  end
end
