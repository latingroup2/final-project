class EjerciciosController < ApplicationController
  
  def iniciar_guia
    holg_inicial=150
    guia = params[:id_guia]
    @track_contenidos = []
    
    Test.find(guia).seccions.each do |seccion|
      @track_contenidos.fill(seccion.contenido_id, @track_contenidos.size, seccion.numero_ejercicios)
    end
    
    @track_contenidos = @track_contenidos.shuffle
    @cont_id  = @track_contenidos[0]
    @track_contenidos = @track_contenidos.last(@track_contenidos.count-1)
    
    catid = Contenido.find(@cont_id).categoria_id
    
    # Genera un nuevo nivel, y el procedimiento es distinto para usuarios nuevos y antiguos
    if current_user.nivels.last==nil
      n = Nivel.new
      n.user_id = current_user.id
      n.save
      
      n=current_user.nivels.last
      n.crear_puntajes
    else
      current_user.nivels.last.generar_siguiente
    end
    
    n = current_user.nivels.last
    p= n.puntajes.where("categoria_id ==?", catid).last
    
    if Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", @cont_id, p.score-holg_inicial, p.score+holg_inicial).last != nil
      id_prox_ej = Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", @cont_id, p.score-holg_inicial, p.score+holg_inicial).sample.id  
    elsif Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", @cont_id, p.score-400, p.score+400).last!= nil
      id_prox_ej = Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", @cont_id, p.score-400, p.score+400).sample.id
    else
      id_prox_ej = Ejercicio.where("contenido_id==?", @cont_id).sample.id
    end
    
    
    # Genera un intento de guia
    i = IntentoTest.new
    i.test_id = guia
    i.user_id=current_user.id
    i.pendiente=Test.find(guia).numero_ej
    i.save
      
    # Setar otras variables que haya que inicializar
    
    session[:track]=@track_contenidos
    
    redirect_to("/ejercitar/res_guia/#{id_prox_ej}", :notice => "Suerte en esta guía!", :counter => @track_contenidos)
  end
  
  
  
  # Compila el proximo ejercicio a mostrar en la guia y crea el intento [current_user, exercise]
  def res_guia
    @track = session[:track]
    idej = params.fetch("id_ej")
    a= Answer.resp(idej)
    @rightanswer = a.right_answer
    @allanswers = [a.right_answer, a.wrong_1, a.wrong_2, a.wrong_3, a.wrong_4].sample(5)
    @idintentoguia = IntentoTest.where("user_id == ?", current_user.id).last.id
    
    @ejercicio = Ejercicio.find(idej)
    @cont = Contenido.find(@ejercicio.contenido_id).nombre 
    
    # crea intento
    i = Try.new
    i.user_id = current_user.id
    i.excercise_id = idej
    i.active = 1
    i.intento_guia_id = @idintentoguia
    i.save
    
    render("ejercicio_templates/ejercitar_guia.html.erb")
  end
  
  
  
  # Da por iniciada una "tanda" de ejercicios de contenido especifico
  def iniciar_especifico
    cont = Contenido.find(params.fetch("id_cont"))
    catid = cont.categoria_id
    holg_inicial=150
    session[:record] = Array.new(10,0)
    
    # Genera un nuevo nivel, y el procedimiento es distinto para usuarios nuevos y antiguos
    if current_user.nivels.last==nil
      n = Nivel.new
      n.user_id = current_user.id
      n.save
      
      n=current_user.nivels.last
      n.crear_puntajes
    else
      current_user.nivels.last.generar_siguiente
    end
    
    n = current_user.nivels.last
    p= n.puntajes.where("categoria_id ==?", catid).last
    
    if Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", params[:id_cont], p.score-holg_inicial, p.score+holg_inicial).last != nil
      id_prox_ej= Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", params[:id_cont], p.score-holg_inicial, p.score+holg_inicial).sample.id
    elsif Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", @cont_id, p.score-400, p.score+400).last != nil
      id_prox_ej= Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", params[:id_cont], p.score-400, p.score+400).sample.id
    else
      id_prox_ej= Ejercicio.where("contenido_id==?", params[:id_cont]).sample.id
    end
      
    # Setar otras variables que haya que inicializar
    
    redirect_to("/ejercitar/res_especifico/#{id_prox_ej}")
  end
  

  
  
  # Compila el proximo ejercicio a mostrar y crea el intento [current_user, exercise]
  def res_especifico
    idej = params.fetch("id_ej")
    a= Answer.resp(idej)
    @rightanswer = a.right_answer
    @allanswers = [a.right_answer, a.wrong_1, a.wrong_2, a.wrong_3, a.wrong_4].sample(5)
    
    @ejercicio = Ejercicio.find(idej)
    @cont = Contenido.find(@ejercicio.contenido_id).nombre 
    
    # crea intento
    i = Try.new
    i.user_id = current_user.id
    i.excercise_id = idej
    i.active = 1
    i.save
    
    render("ejercicio_templates/ejercitar_especifico.html.erb")
  end
  
  
  
  
  # Da por iniciada una "tanda" de ejercicios que permite avanzar progresando
  def iniciar_avanzar
    
    cont = Contenido.find(params.fetch("id_cont"))
    catid = cont.categoria_id
    holg_inicial=150
    record = Array.new(10,0)
    session[:record] = record
    
    # Genera un nuevo nivel, y el procedimiento es distinto para usuarios nuevos y antiguos
    if current_user.nivels.last==nil
      n = Nivel.new
      n.user_id = current_user.id
      n.save
      
      n=current_user.nivels.last
      n.crear_puntajes
    else
      current_user.nivels.last.generar_siguiente
    end
    
    n = current_user.nivels.last
    p= n.puntajes.where("categoria_id ==?", catid).last
    
    if Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", cont.id, p.score-holg_inicial, p.score+holg_inicial).last != nil
      id_prox_ej= Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", cont.id, p.score-holg_inicial, p.score+holg_inicial).sample.id
    elsif Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", cont.id, p.score-400, p.score+400).last != nil
      id_prox_ej= Ejercicio.where("contenido_id==? and dificultad>=? and dificultad <= ?", cont.id, p.score-400, p.score+400).sample.id
    else
      id_prox_ej= Ejercicio.where("contenido_id==?", cont.id).sample.id
    end
    
    redirect_to("/ejercitar/res_avanzar/#{id_prox_ej}")
  end


  
  # Compila el proximo ejercicio a mostrar y crea el intento [current_user, exercise]
  def res_avanzar
    idej = params.fetch("id_ej")
    a= Answer.resp(idej)
    @rightanswer = a.right_answer
    @allanswers = [a.right_answer, a.wrong_1, a.wrong_2, a.wrong_3, a.wrong_4].sample(5)
    
    @ejercicio = Ejercicio.find(idej)
    @cont = Contenido.find(@ejercicio.contenido_id).nombre 
    
    # crea intento
    i = Try.new
    i.user_id = current_user.id
    i.excercise_id = idej
    i.active = 1
    i.save
    
    render("ejercicio_templates/ejercitar_avanzar.html.erb")
  end
  
  
  def index
    @ejercicios = Ejercicio.all

    render("ejercicio_templates/index.html.erb")
  end

  def show
    @ejercicio = Ejercicio.find(params.fetch("id_to_display"))

    render("ejercicio_templates/show.html.erb")
  end

  def new_form
    render("ejercicio_templates/new_form.html.erb")
  end

  def create_row
    @ejercicio = Ejercicio.new

    @ejercicio.contenido_id = params.fetch("contenido_id")
    @ejercicio.dificultad = params.fetch("dificultad")
    @ejercicio.imagen = params.fetch("imagen")
    @ejercicio.pregunta = params.fetch("pregunta")
    @ejercicio.indicador_id = params.fetch("indicador_id")
    @ejercicio.habilidad = params.fetch("habilidad")

    if @ejercicio.valid?
      @ejercicio.save

      redirect_to("/ejercicios", :notice => "Ejercicio created successfully.")
    else
      render("ejercicio_templates/new_form.html.erb")
    end
  end

  def edit_form
    @ejercicio = Ejercicio.find(params.fetch("prefill_with_id"))

    render("ejercicio_templates/edit_form.html.erb")
  end

  def update_row
    @ejercicio = Ejercicio.find(params.fetch("id_to_modify"))

    @ejercicio.contenido_id = params.fetch("contenido_id")
    @ejercicio.dificultad = params.fetch("dificultad")
    @ejercicio.imagen = params.fetch("imagen")
    @ejercicio.pregunta = params.fetch("pregunta")
    @ejercicio.indicador_id = params.fetch("indicador_id")
    @ejercicio.habilidad = params.fetch("habilidad")

    if @ejercicio.valid?
      @ejercicio.save

      redirect_to("/ejercicios/#{@ejercicio.id}", :notice => "Ejercicio updated successfully.")
    else
      render("ejercicio_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @ejercicio = Ejercicio.find(params.fetch("id_to_remove"))

    @ejercicio.destroy

    redirect_to("/ejercicios", :notice => "Ejercicio deleted successfully.")
  end
  
  def show_prof
    @ejercicio = Ejercicio.find(params.fetch("id_to_display"))
    @answer = Answer.where("excercise_id == ?", @ejercicio.id).last

    render("ejercicio_templates/show_prof.html.erb")
  end
  
end
