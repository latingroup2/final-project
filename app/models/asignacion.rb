# == Schema Information
#
# Table name: asignacions
#
#  id         :integer          not null, primary key
#  test_id    :integer
#  sala_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Asignacion < ApplicationRecord
    
    belongs_to :sala
    belongs_to :test

end
