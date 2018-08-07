# == Schema Information
#
# Table name: tries
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  excercise_id    :integer
#  user_answer     :string
#  correct         :boolean
#  active          :boolean
#  intento_guia_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Try < ApplicationRecord
    
    def iniciar
        self.active=1
        self.save
    end
    
    def evaluar
        # self.user_answer = params[:user_answer]
        # right = Answer.where( excercise_id: self.excercise_id).last.right_answer
        # if self.user_answer == right
        #    self.correct = 1
        #else
        #    self.correct =0
        #end
        
        
        self.active=0
        self.save
    end
    
    
end
