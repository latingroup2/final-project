# == Schema Information
#
# Table name: ejercicios
#
#  id           :integer          not null, primary key
#  contenido_id :integer
#  dificultad   :integer
#  imagen       :string
#  pregunta     :text
#  indicador_id :integer
#  habilidad    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  opcion1      :text
#  opcion2      :text
#  opcion3      :text
#  opcion4      :text
#  opcion5      :text
#

class Ejercicio < ApplicationRecord
    
    
    has_many :tries, :foreign_key => "excercise_id", :dependent => :destroy
    belongs_to :contenido
    
    has_one :materia, :through => :contenido, :source => :materia
    
    def prox_ej_test(last_try)
        # define
    end
    
    def prox_ej_cont(last_try)
        # define
    end
    
    def prox_ej_free(last_try)
        # define
    end
    
    
end
