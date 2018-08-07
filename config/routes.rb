Rails.application.routes.draw do
  # Routes for the Tema resource:

  # CREATE
  get("/temas/new", { :controller => "temas", :action => "new_form" })
  post("/create_tema", { :controller => "temas", :action => "create_row" })

  # READ
  get("/temas", { :controller => "temas", :action => "index" })
  get("/temas/:id_to_display", { :controller => "temas", :action => "show" })

  # UPDATE
  get("/temas/:prefill_with_id/edit", { :controller => "temas", :action => "edit_form" })
  post("/update_tema/:id_to_modify", { :controller => "temas", :action => "update_row" })

  # DELETE
  get("/delete_tema/:id_to_remove", { :controller => "temas", :action => "destroy_row" })

  #------------------------------

  # Routes for the Colegio resource:

  # CREATE
  get("/colegios/new", { :controller => "colegios", :action => "new_form" })
  post("/create_colegio", { :controller => "colegios", :action => "create_row" })

  # READ
  get("/colegios", { :controller => "colegios", :action => "index" })
  get("/colegios/:id_to_display", { :controller => "colegios", :action => "show" })

  # UPDATE
  get("/colegios/:prefill_with_id/edit", { :controller => "colegios", :action => "edit_form" })
  post("/update_colegio/:id_to_modify", { :controller => "colegios", :action => "update_row" })

  # DELETE
  get("/delete_colegio/:id_to_remove", { :controller => "colegios", :action => "destroy_row" })

  #------------------------------

  devise_for :profesors
  # Routes for the Sala resource:

  # CREATE
  get("/salas/new", { :controller => "salas", :action => "new_form" })
  post("/create_sala", { :controller => "salas", :action => "create_row" })

  # READ
  get("/salas", { :controller => "salas", :action => "index" })
  get("/salas_prof", { :controller => "salas", :action => "index_prof" })
  get("/salas/:id_to_display", { :controller => "salas", :action => "show" })

  # UPDATE
  get("/salas/:prefill_with_id/edit", { :controller => "salas", :action => "edit_form" })
  post("/update_sala/:id_to_modify", { :controller => "salas", :action => "update_row" })

  # DELETE
  get("/delete_sala/:id_to_remove", { :controller => "salas", :action => "destroy_row" })

  #------------------------------

  # Routes for the Asignacion resource:

  # CREATE
  get("/asignacions/new", { :controller => "asignacions", :action => "new_form" })
  post("/create_asignacion", { :controller => "asignacions", :action => "create_row" })

  # READ
  get("/asignacions", { :controller => "asignacions", :action => "index" })
  get("/asignacions/:id_to_display", { :controller => "asignacions", :action => "show" })

  # UPDATE
  get("/asignacions/:prefill_with_id/edit", { :controller => "asignacions", :action => "edit_form" })
  post("/update_asignacion/:id_to_modify", { :controller => "asignacions", :action => "update_row" })

  # DELETE
  get("/delete_asignacion/:id_to_remove", { :controller => "asignacions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Intento test resource:

  # CREATE
  get("/intento_tests/new", { :controller => "intento_tests", :action => "new_form" })
  post("/create_intento_test", { :controller => "intento_tests", :action => "create_row" })

  # READ
  get("/intento_tests", { :controller => "intento_tests", :action => "index" })
  get("/intento_tests/:id_to_display", { :controller => "intento_tests", :action => "show" })

  # UPDATE
  get("/intento_tests/:prefill_with_id/edit", { :controller => "intento_tests", :action => "edit_form" })
  post("/update_intento_test/:id_to_modify", { :controller => "intento_tests", :action => "update_row" })

  # DELETE
  get("/delete_intento_test/:id_to_remove", { :controller => "intento_tests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Seccion resource:

  # CREATE
  get("/seccions/new", { :controller => "seccions", :action => "new_form" })
  post("/create_seccion", { :controller => "seccions", :action => "create_row" })

  # READ
  get("/seccions", { :controller => "seccions", :action => "index" })
  get("/seccions/:id_to_display", { :controller => "seccions", :action => "show" })

  # UPDATE
  get("/seccions/:prefill_with_id/edit", { :controller => "seccions", :action => "edit_form" })
  post("/update_seccion/:id_to_modify", { :controller => "seccions", :action => "update_row" })

  # DELETE
  get("/delete_seccion/:id_to_remove", { :controller => "seccions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Test resource:

  # CREATE
  get("/tests/new", { :controller => "tests", :action => "new_form" })
  post("/create_test", { :controller => "tests", :action => "create_row" })

  # READ
  get("/tests", { :controller => "tests", :action => "index" })
  get("/tests_prof", { :controller => "tests", :action => "index_prof" })
  get("/tests/:id_to_display", { :controller => "tests", :action => "show" })
  

  # UPDATE
  get("/tests/:prefill_with_id/edit", { :controller => "tests", :action => "edit_form" })
  post("/update_test/:id_to_modify", { :controller => "tests", :action => "update_row" })

  # DELETE
  get("/delete_test/:id_to_remove", { :controller => "tests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Puntaje resource:

  # CREATE
  get("/puntajes/new", { :controller => "puntajes", :action => "new_form" })
  post("/create_puntaje", { :controller => "puntajes", :action => "create_row" })

  # READ
  get("/puntajes", { :controller => "puntajes", :action => "index" })
  get("/puntajes/:id_to_display", { :controller => "puntajes", :action => "show" })

  # UPDATE
  get("/puntajes/:prefill_with_id/edit", { :controller => "puntajes", :action => "edit_form" })
  post("/update_puntaje/:id_to_modify", { :controller => "puntajes", :action => "update_row" })

  # DELETE
  get("/delete_puntaje/:id_to_remove", { :controller => "puntajes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Tributo resource:

  # CREATE
  get("/tributos/new", { :controller => "tributos", :action => "new_form" })
  post("/create_tributo", { :controller => "tributos", :action => "create_row" })

  # READ
  get("/tributos", { :controller => "tributos", :action => "index" })
  get("/tributos/:id_to_display", { :controller => "tributos", :action => "show" })

  # UPDATE
  get("/tributos/:prefill_with_id/edit", { :controller => "tributos", :action => "edit_form" })
  post("/update_tributo/:id_to_modify", { :controller => "tributos", :action => "update_row" })

  # DELETE
  get("/delete_tributo/:id_to_remove", { :controller => "tributos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Contenido resource:

  # CREATE
  get("/contenidos/new", { :controller => "contenidos", :action => "new_form" })
  post("/create_contenido", { :controller => "contenidos", :action => "create_row" })

  # READ
  get("/contenidos", { :controller => "contenidos", :action => "index" })
  get("/contenidos/especifico", { :controller => "contenidos", :action => "ver_especifico" })
  get("/contenidos/avanzar", { :controller => "contenidos", :action => "ver_avanzar" })
  get("/contenidos/:id_to_display", { :controller => "contenidos", :action => "show" })

  # UPDATE
  get("/contenidos/:prefill_with_id/edit", { :controller => "contenidos", :action => "edit_form" })
  post("/update_contenido/:id_to_modify", { :controller => "contenidos", :action => "update_row" })

  # DELETE
  get("/delete_contenido/:id_to_remove", { :controller => "contenidos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Nivel resource:

  # CREATE
  get("/nivels/new", { :controller => "nivels", :action => "new_form" })
  post("/create_nivel", { :controller => "nivels", :action => "create_row" })

  # READ
  get("/nivels", { :controller => "nivels", :action => "index" })
  get("/nivels/:id_to_display", { :controller => "nivels", :action => "show" })
  get("/nivels_prof/:id_to_display", { :controller => "nivels", :action => "show_alumno" })

  # UPDATE
  get("/nivels/:prefill_with_id/edit", { :controller => "nivels", :action => "edit_form" })
  post("/update_nivel/:id_to_modify", { :controller => "nivels", :action => "update_row" })

  # DELETE
  get("/delete_nivel/:id_to_remove", { :controller => "nivels", :action => "destroy_row" })

  #------------------------------

  # Routes for the Categorium resource:

  # CREATE
  get("/categoria/new", { :controller => "categoria", :action => "new_form" })
  post("/create_categorium", { :controller => "categoria", :action => "create_row" })

  # READ
  get("/categoria", { :controller => "categoria", :action => "index" })
  get("/categoria/:id_to_display", { :controller => "categoria", :action => "show" })

  # UPDATE
  get("/categoria/:prefill_with_id/edit", { :controller => "categoria", :action => "edit_form" })
  post("/update_categorium/:id_to_modify", { :controller => "categoria", :action => "update_row" })

  # DELETE
  get("/delete_categorium/:id_to_remove", { :controller => "categoria", :action => "destroy_row" })

  #------------------------------

  # Routes for the Objetivo resource:

  # CREATE
  get("/objetivos/new", { :controller => "objetivos", :action => "new_form" })
  post("/create_objetivo", { :controller => "objetivos", :action => "create_row" })

  # READ
  get("/objetivos", { :controller => "objetivos", :action => "index" })
  get("/objetivos/:id_to_display", { :controller => "objetivos", :action => "show" })

  # UPDATE
  get("/objetivos/:prefill_with_id/edit", { :controller => "objetivos", :action => "edit_form" })
  post("/update_objetivo/:id_to_modify", { :controller => "objetivos", :action => "update_row" })

  # DELETE
  get("/delete_objetivo/:id_to_remove", { :controller => "objetivos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Indicator resource:

  # CREATE
  get("/indicators/new", { :controller => "indicators", :action => "new_form" })
  post("/create_indicator", { :controller => "indicators", :action => "create_row" })

  # READ
  get("/indicators", { :controller => "indicators", :action => "index" })
  get("/indicators/:id_to_display", { :controller => "indicators", :action => "show" })

  # UPDATE
  get("/indicators/:prefill_with_id/edit", { :controller => "indicators", :action => "edit_form" })
  post("/update_indicator/:id_to_modify", { :controller => "indicators", :action => "update_row" })

  # DELETE
  get("/delete_indicator/:id_to_remove", { :controller => "indicators", :action => "destroy_row" })

  #------------------------------

  # Routes for the Try resource:

  # CREATE
  get("/tries/new", { :controller => "tries", :action => "new_form" })
  post("/create_try", { :controller => "tries", :action => "create_row" })

  # READ
  get("/tries", { :controller => "tries", :action => "index" })
  get("/tries/:id_to_display", { :controller => "tries", :action => "show" })

  # UPDATE
  get("/tries/:prefill_with_id/edit", { :controller => "tries", :action => "edit_form" })
  post("/update_try/:id_to_modify", { :controller => "tries", :action => "update_row" })

  # DELETE
  get("/delete_try/:id_to_remove", { :controller => "tries", :action => "destroy_row" })

  #------------------------------

  # Routes for the Answer resource:

  # CREATE
  get("/answers/new", { :controller => "answers", :action => "new_form" })
  post("/create_answer", { :controller => "answers", :action => "create_row" })

  # EJERCITAR
  
  get("/answers/evaluar_especifico", { :controller => "answers", :action => "eval_especifico" })
  get("/answers/evaluar_avanzar", { :controller => "answers", :action => "eval_avanzar" })
  get("/answers/evaluar_guia", { :controller => "answers", :action => "eval_guia" })
  
  # READ
  get("/answers", { :controller => "answers", :action => "index" })
  get("/answers/cerrar", { :controller => "answers", :action => "cerrar" })
  get("/answers/:id_to_display", { :controller => "answers", :action => "show" })
  
  # UPDATE
  get("/answers/:prefill_with_id/edit", { :controller => "answers", :action => "edit_form" })
  post("/update_answer/:id_to_modify", { :controller => "answers", :action => "update_row" })

  # DELETE
  get("/delete_answer/:id_to_remove", { :controller => "answers", :action => "destroy_row" })
  

  #------------------------------

  # Routes for the Eje resource:

  # CREATE
  get("/ejes/new", { :controller => "ejes", :action => "new_form" })
  post("/create_eje", { :controller => "ejes", :action => "create_row" })

  # READ
  get("/ejes", { :controller => "ejes", :action => "index" })
  get("/ejes/:id_to_display", { :controller => "ejes", :action => "show" })

  # UPDATE
  get("/ejes/:prefill_with_id/edit", { :controller => "ejes", :action => "edit_form" })
  post("/update_eje/:id_to_modify", { :controller => "ejes", :action => "update_row" })

  # DELETE
  get("/delete_eje/:id_to_remove", { :controller => "ejes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ejercicio resource:
  
  root "ejercicios#index"
  
  # CREATE
  get("/ejercicios/new", { :controller => "ejercicios", :action => "new_form" })
  post("/create_ejercicio", { :controller => "ejercicios", :action => "create_row" })

  
  # COMENZAR EJERCICIOS
  get("/ejercitar/com_guia/:id_guia", { :controller => "ejercicios", :action => "iniciar_guia" })
  get("/ejercitar/com_especifico/:id_cont", { :controller => "ejercicios", :action => "iniciar_especifico" })
  get("/ejercitar/com_avanzar/:id_cont", { :controller => "ejercicios", :action => "iniciar_avanzar" })
  
  # RESOLVER EJERCICIOS
  get("/ejercitar/res_guia/:id_ej", { :controller => "ejercicios", :action => "res_guia" })
  get("/ejercitar/res_especifico/:id_ej", { :controller => "ejercicios", :action => "res_especifico" })
  get("/ejercitar/res_avanzar/:id_ej", { :controller => "ejercicios", :action => "res_avanzar" })
  
  # READ
  get("/ejercicios", { :controller => "ejercicios", :action => "index" })
  get("/ejercicios/:id_to_display", { :controller => "ejercicios", :action => "show" })
  get("/ejercicios_prof/:id_to_display", { :controller => "ejercicios", :action => "show_prof" })
  
  
  # UPDATE
  get("/ejercicios/:prefill_with_id/edit", { :controller => "ejercicios", :action => "edit_form" })
  post("/update_ejercicio/:id_to_modify", { :controller => "ejercicios", :action => "update_row" })

  # DELETE
  get("/delete_ejercicio/:id_to_remove", { :controller => "ejercicios", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  

  
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
