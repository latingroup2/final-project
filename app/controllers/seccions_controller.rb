class SeccionsController < ApplicationController
  def index
    @seccions = Seccion.all

    render("seccion_templates/index.html.erb")
  end

  def show
    @seccion = Seccion.find(params.fetch("id_to_display"))

    render("seccion_templates/show.html.erb")
  end

  def new_form
    render("seccion_templates/new_form.html.erb")
  end

  def create_row
    @seccion = Seccion.new

    @seccion.contenido_id = params.fetch("contenido_id")
    @seccion.test_id = params.fetch("test_id")
    @seccion.numero_ejercicios = params.fetch("numero_ejercicios")
    @seccion.nombre = params.fetch("nombre")

    if @seccion.valid?
      @seccion.save

      redirect_back fallback_location: root_path
    else
      render("seccion_templates/new_form.html.erb")
    end
  end

  def edit_form
    @seccion = Seccion.find(params.fetch("prefill_with_id"))

    render("seccion_templates/edit_form.html.erb")
  end

  def update_row
    @seccion = Seccion.find(params.fetch("id_to_modify"))

    @seccion.contenido_id = params.fetch("contenido_id")
    @seccion.test_id = params.fetch("test_id")
    @seccion.numero_ejercicios = params.fetch("numero_ejercicios")
    @seccion.nombre = params.fetch("nombre")

    if @seccion.valid?
      @seccion.save

      redirect_to("/seccions/#{@seccion.id}", :notice => "Seccion updated successfully.")
    else
      render("seccion_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @seccion = Seccion.find(params.fetch("id_to_remove"))

    @seccion.destroy

    redirect_back fallback_location: root_path
  end
end
