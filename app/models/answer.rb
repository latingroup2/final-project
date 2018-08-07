# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  right_answer :text
#  wrong_1      :text
#  wrong_2      :text
#  wrong_3      :text
#  wrong_4      :text
#  excercise_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Answer < ApplicationRecord
    
    def self.resp(ejid)
        where("excercise_id = ?", ejid).last
    end
    
end
