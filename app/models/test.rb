# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  profesor_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  nombre      :text
#

class Test < ApplicationRecord
    
    has_many :seccions, :dependent => :destroy
    has_many :asignacions, :dependent => :destroy
    has_many :salas, :through => :asignacions, :source => :sala
    
    def resuelta(usid)
        IntentoTest.where(:test_id => self.id, :user_id => usid).last != nil
    end
    
    
    # Devuelve el par [mejor_puntaje/total preguntas (en % de 0 a 1), id_intento]
    def mejor_puntaje(usid)
        mayor = 0
        num = 0
        aux=0
        
        Seccion.where(test_id: self.id).each do |seccion|
            num = seccion.numero_ejercicios + num
        end
        
        IntentoTest.where(:test_id =>  self.id, :user_id => usid).each do |intento|
            
            buenas = Try.where(:intento_guia_id => intento.id,  :correct => true).count
            
            if buenas.to_f/num >= mayor
                mayor = buenas.to_f/num
                aux = intento.id
            end
            
        end
        
        ret = [mayor,aux]
        
        return(ret)
    end
    
    def numero_ej 
        tot = 0
        self.seccions.each do |seccion|
            tot=tot+seccion.numero_ejercicios
        end
        return(tot)
    end
    
end
