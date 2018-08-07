# == Schema Information
#
# Table name: salas
#
#  id          :integer          not null, primary key
#  profesor_id :integer
#  colegio_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  nombre      :text
#

class Sala < ApplicationRecord
    
    # Directa
    has_many :asignacions, :dependent => :destroy
    has_many :users
    
    # Indirecta
    has_many :guias, :through => :asignacions, :source => :test
    
    def alumnos_en_rango(inf,sup,catid)
        contador = 0
        self.users.each do |alumno|
            if alumno.nivels.last != nil
                if alumno.nivels.last.puntajes.where("categoria_id==?", catid).last.score >= inf
                    if alumno.nivels.last.puntajes.where("categoria_id==?", catid).last.score < sup
                        contador = contador+1
                    end
                end
            end
        end
        
        return(contador)
    end
    
end
