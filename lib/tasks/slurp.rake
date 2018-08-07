namespace :slurp do
  desc "TODO"
  task transactions: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "axes.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Axis.new
      t.title = row["Title"]
      t.save
      puts "#{t.title} saved"
    end
    
    puts "There are now #{Axis.count} rows in the axis table"
  
  end
  
  task objectives: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "objectives.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Objective.new
      t.description = row["Description"]
      t.axis_id = row["Axis Id"]
      t.previous_id = row["previous"]
      t.next_id = row["next"]
      t.save
      puts "#{t.description} saved"
    end
    
    puts "There are now #{Objective.count} rows in the objectives table"
  
  end
  
  task excercises: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "ejercicios.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Ejercicio.new
      t.pregunta = row["Ejercicio"]
      t.contenido_id = row["Contenido"]
      t.dificultad = row["Dificultad"]
      t.habilidad = row["Habilidad"]
      t.opcion1 = row["O1"]
      t.opcion2 = row["O2"]
      t.opcion3 = row["O3"]
      t.opcion4 = row["O4"]
      t.opcion5 = row["O5"]
      t.save
      puts "#{t.id} saved"
    end
    
    puts "There are now #{Ejercicio.count} rows in the excercise table"
  
  end
  
    task answers: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "ejercicios.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Answer.new
      t.right_answer = row["Respuesta"]
      t.excercise_id = row["excercise_id"]
      t.wrong_1 = row["W1"]
      t.wrong_2 = row["W2"]
      t.wrong_3 = row["W3"]
      t.wrong_4 = row["W4"]
      t.save
      puts "#{t.excercise_id} saved"
    end
    
    puts "There are now #{Answer.count} rows in the answer table"
  
  end
  
  task contenidos: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "contenidos.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Contenido.new
      t.nombre = row["Enunciado"]
      t.anterior = row["id contenido anterior"]
      t.siguiente = row["id contenido siguiente"]
      t.categoria_id = row["id categoría"]
      t.tema_id = row["id tema"]
      
      t.save
      puts "#{t.nombre} saved"
    end
    
    puts "There are now #{Contenido.count} rows in the contenido table"
  
  end
  
  task temas: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "temas.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Tema.new
      t.nombre = row["Enunciado"]

      t.save
      puts "#{t.nombre} saved"
    end
    
    puts "There are now #{Tema.count} rows in the temas table"
  
  end
  
    task update_excercises: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "ejercicios.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Ejercicio.find(row["excercise_id"])
      t.dificultad = row["Dificultad"]
      t.save
      puts "#{t.id} updated"
    end
    
    puts "There are now #{Ejercicio.count} rows in the excercise table"
  end
  
  task load_users: :environment do
  require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "usuarios.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
      u = User.create!({:email => row["EMAIL"], :password => row["PASSWORD"], :password_confirmation => row["PASSWORD"]})  
      u.first_name = row["NOMBRE"]
      u.last_name = row["APELLIDO"]
      u.sala_id = row["SALA ID"]
      u.pinicial = row["PINICIAL"]
      u.save
    end
    
    puts "There are now #{User.count} rows in the usuario table"
  end
  
  task nivel_users: :environment do
  require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "usuarios.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
      u = User.find(row["user_id"])  
      n = Nivel.new
      n.user_id = u.id
      n.save
      
      Categorium.all.each do |cat|
            p=Puntaje.new
            p.categoria_id = cat.id
            p.nivel_id = n.id
            p.score= u.pinicial
            p.save
      end
      
    end
    
    puts "There are now #{Nivel.count} rows in the Nivel table, and #{Puntaje.count} rows in the Puntaje table"
  end
  
  
end
