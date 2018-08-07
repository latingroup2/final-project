# == Schema Information
#
# Table name: nivels
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Nivel < ApplicationRecord
    
    has_many :puntajes, :dependent => :destroy
    
    def crear_puntajes
        Categorium.all.each do |cat|
            p=Puntaje.new
            p.categoria_id = cat.id
            p.nivel_id = self.id
            p.score=0
            p.save
        end
    end
    
    def generar_siguiente
        n = Nivel.new
        n.user_id = self.user_id
        n.save
        
        idi = User.find(self.user_id).nivels.last.id
        
        self.puntajes.each do |p|
            pun=Puntaje.new
            pun.nivel_id = idi
            pun.categoria_id = p.categoria_id
            pun.score = p.score
            pun.save
        end
    end
    
    def self.ultimo_nivel(userid, days)
        where("created_at <= ? and user_id == ?", Time.zone.now - days*24*60*60, userid).last
    end
    
end
