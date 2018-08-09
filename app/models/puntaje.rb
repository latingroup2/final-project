# == Schema Information
#
# Table name: puntajes
#
#  id           :integer          not null, primary key
#  nivel_id     :integer
#  categoria_id :integer
#  score        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Puntaje < ApplicationRecord
    
    
 def nuevo_puntaje(correcto, ejid, usid)
   
      actual = self.score
      holgura_buena = 50
      holgura_mala =50
      dif = Ejercicio.find(ejid).dificultad
      catid = self.categoria_id
      historia = 20
      pun_historico=0
      ult_tries = [0]
      pond_hist = 0.95
      pond_actual = 0.10
      base=300
      
      if Categorium.find(catid).tries.where(user_id: usid).last == nil
        pun_historico = 0

      elsif Categorium.find(catid).tries.where(user_id: usid).count < historia
        ult_tries = Categorium.find(catid).tries.where(user_id: usid)
      else
        ult_tries = Categorium.find(catid).tries.where(user_id: usid).last(historia)
      end
      
      if ult_tries != [0]
        numerador = 0
        contador = 0 
        
        ult_tries.each do |try|
            contador=contador+1
            numerador = numerador + 1.0/(ult_tries.count+1-contador)
            
            if try.correct
              pun_historico = pun_historico + Ejercicio.find(try.excercise_id).dificultad/(ult_tries.count+1-contador)
            end
        end
      end
      
      pun_historico = pun_historico.to_f/numerador
      
      if correcto == 1
        pun_actual = ([[dif + holgura_buena, 1000].min - self.score,0].max )+base
      else
        pun_actual = [0, (-1)*Math.sqrt([(self.score - [dif - holgura_mala, 0].max),0].max)].min-base
      end
      
      return([[actual + pun_actual*pond_actual,1000].min,0].max )
      # return(pun_historico*pond_hist + pun_actual*pond_actual) 
      
 end

# OJO. INCOMPLETA. Hay que hacerlo "mayor o igual". Muestra los puntajes de un nivel en particular, sobre un plazo (en dias)
 def self.mostrar_puntajes(nivelid, days)
     where(:created_at => Time.zone.now - days*24*60*60, :nivel_id => nivelid)
 end
    
end

