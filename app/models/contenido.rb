# == Schema Information
#
# Table name: contenidos
#
#  id           :integer          not null, primary key
#  nombre       :text
#  anterior     :integer
#  siguiente    :integer
#  categoria_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tema_id      :integer
#

class Contenido < ApplicationRecord
    
    has_many :ejercicios
    belongs_to :materia, :class_name => "Categorium", :foreign_key => "categoria_id"
    belongs_to :tema, :class_name => "Tema", :foreign_key => "tema_id"

end
