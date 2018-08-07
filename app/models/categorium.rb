# == Schema Information
#
# Table name: categoria
#
#  id          :integer          not null, primary key
#  descripcion :text
#  eje_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Categorium < ApplicationRecord
    
    has_many :contenidos, :foreign_key => "categoria_id", :dependent => :destroy
    
    has_many :ejercicios, :through => :contenidos, :source => :ejercicios
    has_many :tries, :through => :ejercicios, :source => :tries
    
end
