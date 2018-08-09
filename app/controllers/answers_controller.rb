class AnswersController < ApplicationController
  def index
    @answers = Answer.all

    render("answer_templates/index.html.erb")
  end


  def show
    @answer = Answer.find(params.fetch("id_to_display"))

    render("answer_templates/show.html.erb")
  end
  

  def eval_guia
    @track_contenidos = session[:track]
    idej = params[:excercise_id]
    right = params[:right_answer]
    useranswer = params[:user_answer]
    idintentoguia = params[:intento_test]
    cat = Ejercicio.find(idej).materia.id
    holgura_nextej = 150
    
    if right == useranswer
      correcto = 1
    else
      correcto=0
    end
    
    t = Try.where(user_id: current_user.id).last
    t.active=0
    t.correct=correcto
    t.user_answer=useranswer
    t.save
    
    # Alterar el nivel del alumno de acuerdo a resultado
    n = current_user.nivels.last
    p= n.puntajes.where(categoria_id: cat).last
    p.score = p.nuevo_puntaje(correcto, idej, current_user.id)
    p.save
    
    if IntentoTest.find(idintentoguia).pendiente == 1
      res = (Try.where(:intento_guia_id => idintentoguia, :correct => true).count.to_f / Try.where(intento_guia_id: idintentoguia).count)*100
      mensaje = "Terminamos la guia con #{res}% de respuestas correctas. Buen esfuerzo!"
      redirect_to("/ejercicios", :notice => mensaje)
    else
      it = IntentoTest.find(idintentoguia)
      it.pendiente = it.pendiente-1
      it.save
      
      @track_contenidos = @track_contenidos.shuffle
      contid = @track_contenidos[0]
      @track_contenidos = @track_contenidos.last(@track_contenidos.count-1)
    
      session[:track] = @track_contenidos

    if Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-holg_nextej)..(p.score+holg_nextej)).last != nil
      id_prox_ej = Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-holg_nextej)..(p.score+holg_nextej)).sample.id  
    elsif Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-400)..(p.score+400)).last!= nil
      id_prox_ej = Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-400)..(p.score+400)).sample.id
    else
      id_prox_ej = Ejercicio.where(contenido_id: contid).sample.id
    end

      if correcto == 1
        mensaje = "Correcto! Sigamos así" 
      else
        mensaje = "No exactamente. Probemos con este:"
      end  
  
      redirect_to("/ejercitar/res_guia/#{id_prox_ej}", :notice => mensaje)
    end
  end




  def eval_especifico
    idej = params[:excercise_id]
    right = params[:right_answer]
    useranswer = params[:user_answer]
    cat = Ejercicio.find(idej.to_i).materia.id
    record=[]
    record = session[:record]
    correcto=0
    
    contid = Ejercicio.find(idej.to_i).contenido_id
    avance = false
    holgura_nextej = 150
    penal_subir = 0.15 * (-1)
    gratif_bajar = 0.1
    
    if right == useranswer
      correcto = 1
      record = record.last(record.size-1).push(1)
    else
      correcto=0
      record = record.last(record.size-1).push(-1)
    end

    
    t = Try.where(user_id: current_user.id).last
    t.active=0
    t.correct=correcto
    t.user_answer=useranswer
    t.save
    
    # Alterar el nivel del alumno de acuerdo a resultado
    n = current_user.nivels.last
    p= n.puntajes.where(categoria_id: cat).last
    p.score = p.nuevo_puntaje(correcto, idej, current_user.id)
    p.save

    # Ve si subir de contenido
    if p.score > 500
      if record.last(3).count(1)==3
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)+1, Contenido.find(contid).tema.contenidos.pluck("id").max].min]
        avance = true
        
      elsif record.last(5).count(1)>=4
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)+1, Contenido.find(contid).tema.contenidos.pluck("id").max].min]
        avance = true
        
      elsif record.last(4).count(-1)==4
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)-1, Contenido.find(contid).tema.contenidos.pluck("id").min].max]
        avance = true
        
      elsif record.last(9).count(-1)>=7
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)-1, Contenido.find(contid).tema.contenidos.pluck("id").min].max]
        avance = true
        
      end
    else
      if record.last(4).count(1)==4
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)+1, Contenido.find(contid).tema.contenidos.pluck("id").max].min]
        avance = true
        
      elsif record.last(9).count(1)>=7
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)+1, Contenido.find(contid).tema.contenidos.pluck("id").max].min]
        avance = true
        
      elsif record.last(3).count(-1)==3
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)-1, Contenido.find(contid).tema.contenidos.pluck("id").min].max]
        avance = true
        
      elsif record.last(5).count(-1)>=4
        contid=Contenido.find(contid).tema.contenidos.pluck("id")[[Contenido.find(contid).tema.contenidos.pluck("id").find_index(contid)-1, Contenido.find(contid).tema.contenidos.pluck("id").min].max]
        avance = true
        
      end
    end

    session[:record]=record

    if Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-holg_nextej)..(p.score+holg_nextej)).last != nil
      id_prox_ej = Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-holg_nextej)..(p.score+holg_nextej)).sample.id  
    elsif Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-400)..(p.score+400)).last!= nil
      id_prox_ej = Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-400)..(p.score+400)).sample.id
    else
      id_prox_ej = Ejercicio.where(contenido_id: contid).sample.id
    end
    
    
    if correcto == 1
      if avance
        mensaje = "Muy bien!! Estás listo para pasar a " + Contenido.find(contid).nombre + ". Sigue así!"
        session[:record]=Array.new(session[:record].size,0)
        p.score = p.score*(1+penal_subir)
        p.save
      else  
        mensaje = "Correcto! Sigamos así" 
      end
        
    else
      if avance
        mensaje = "No exactamente. Probemos reforzando la base del contenido con "+Contenido.find(contid).nombre
        session[:record]=Array.new(session[:record].size,0)
        p.score = p.score*(1+gratif_bajar)
        p.save
      else  
        mensaje = "No exactamente. Probemos con este:"
      end
    end  
    
    redirect_to("/ejercitar/res_especifico/#{id_prox_ej}", :notice => mensaje)
    
  end


  def eval_avanzar
    idej = params[:excercise_id]
    right = params[:right_answer]
    useranswer = params[:user_answer]
    cat = Ejercicio.find(idej).materia.id
    record = session[:record]

    contid = Ejercicio.find(idej).contenido_id
    avance = false
    holgura_nextej = 150
    penal_subir = (-1) * (0.15)
    gratif_bajar = 0.10
    
    if right == useranswer
      correcto = 1
      record = record.last(record.size-1).push(1)
    else
      correcto=0
      record = record.last(record.size-1).push(-1)
    end

    t = Try.where(user_id: current_user.id).last
    t.active=0
    t.correct=correcto
    t.user_answer=useranswer
    t.save

    # Alterar el nivel del alumno de acuerdo a resultado
    n = current_user.nivels.last
    p= n.puntajes.where(categoria_id: cat).last
    p.score = p.nuevo_puntaje(correcto, idej, current_user.id)
    p.save

    # Ve si subir de contenido
    if p.score > 500
      if record.last(3).count(1)==3
        contid=Contenido.find(contid).siguiente
        avance = true
        
      elsif record.last(5).count(1)>=4
        contid=Contenido.find(contid).siguiente
        avance = true
        
      elsif record.last(5).count(-1)==5
        contid=Contenido.find(contid).anterior
        avance = true
        
      elsif record.last(9).count(-1)>=7
        contid=Contenido.find(contid).anterior
        avance = true
        
      end
    else
      if record.last(5).count(1)==5
        contid=Contenido.find(contid).siguiente
        avance = true
        
      elsif record.last(9).count(1)>=7
        contid=Contenido.find(contid).siguiente
        avance = true
        
      elsif record.last(3).count(-1)==3
        contid=Contenido.find(contid).anterior
        avance = true
        
      elsif record.last(5).count(-1)>=4
        contid=Contenido.find(contid).anterior
        avance = true
      end
    end

    session[:record]=record

    if Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-holg_nextej)..(p.score+holg_nextej)).last != nil
      id_prox_ej = Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-holg_nextej)..(p.score+holg_nextej)).sample.id  
    elsif Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-400)..(p.score+400)).last!= nil
      id_prox_ej = Ejercicio.where(:contenido_id => contid).where(dificultad: (p.score-400)..(p.score+400)).sample.id
    else
      id_prox_ej = Ejercicio.where(contenido_id: contid).sample.id
    end
    
    
    if correcto == 1
      if avance
        mensaje = "Muy bien!! Estás listo para pasar a " + Contenido.find(contid).nombre + ". Sigue así!"
        session[:record]=Array.new(session[:record].size,0)
        p.score = p.score*(1+penal_subir)
        p.save
      else  
        mensaje = "Correcto! Sigamos así" 
      end
        
    else
      if avance
        mensaje = "No exactamente. Probemos reforzando la base del contenido con "+Contenido.find(contid).nombre
        session[:record]=Array.new(session[:record].size,0)
        p.score = p.score*(1+gratif_bajar)
        p.save
      else  
        mensaje = "No exactamente. Probemos con este:"
      end
    end  
    
    redirect_to("/ejercitar/res_avanzar/#{id_prox_ej}", :notice => mensaje)
  end
  
  
  def new_form
    render("answer_templates/new_form.html.erb")
  end

  def create_row
    @answer = Answer.new

    @answer.right_answer = params.fetch("right_answer")
    @answer.wrong_1 = params.fetch("wrong_1")
    @answer.wrong_2 = params.fetch("wrong_2")
    @answer.wrong_3 = params.fetch("wrong_3")
    @answer.wrong_4 = params.fetch("wrong_4")
    @answer.excercise_id = params.fetch("excercise_id")

    if @answer.valid?
      @answer.save

      redirect_to("/answers", :notice => "Answer created successfully.")
    else
      render("answer_templates/new_form.html.erb")
    end
  end

  def edit_form
    @answer = Answer.find(params.fetch("prefill_with_id"))

    render("answer_templates/edit_form.html.erb")
  end

  def update_row
    @answer = Answer.find(params.fetch("id_to_modify"))

    @answer.right_answer = params.fetch("right_answer")
    @answer.wrong_1 = params.fetch("wrong_1")
    @answer.wrong_2 = params.fetch("wrong_2")
    @answer.wrong_3 = params.fetch("wrong_3")
    @answer.wrong_4 = params.fetch("wrong_4")
    @answer.excercise_id = params.fetch("excercise_id")

    if @answer.valid?
      @answer.save

      redirect_to("/answers/#{@answer.id}", :notice => "Answer updated successfully.")
    else
      render("answer_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @answer = Answer.find(params.fetch("id_to_remove"))
    @answer.destroy

    redirect_to("/answers", :notice => "Answer deleted successfully.")
  end
  
  # Finaliza el grupo de ejercicios que estaba haciendo el alumno y elimina el intento que esta abierto
  def cerrar
    @try = Try.where(user_id: current_user.id).last
    @try.destroy
    
    redirect_to("/ejercicios", :notice => "Buen esfuerzo!")
  end
  
  
end
