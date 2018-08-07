class AsignacionsController < ApplicationController
  def index
    @asignacions = Asignacion.all

    render("asignacion_templates/index.html.erb")
  end

  def show
    @asignacion = Asignacion.find(params.fetch("id_to_display"))

    render("asignacion_templates/show.html.erb")
  end

  def new_form
    render("asignacion_templates/new_form.html.erb")
  end

  def create_row
    @asignacion = Asignacion.new

    @asignacion.test_id = params.fetch("test_id")
    @asignacion.sala_id = params.fetch("sala_id")

    if @asignacion.valid?
      @asignacion.save

      redirect_back fallback_location: root_path
    else
      render("asignacion_templates/new_form.html.erb")
    end
  end

  def edit_form
    @asignacion = Asignacion.find(params.fetch("prefill_with_id"))

    render("asignacion_templates/edit_form.html.erb")
  end

  def update_row
    @asignacion = Asignacion.find(params.fetch("id_to_modify"))

    @asignacion.test_id = params.fetch("test_id")
    @asignacion.sala_id = params.fetch("sala_id")

    if @asignacion.valid?
      @asignacion.save

      redirect_to("/asignacions/#{@asignacion.id}", :notice => "Asignacion updated successfully.")
    else
      render("asignacion_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @asignacion = Asignacion.find(params.fetch("id_to_remove"))

    @asignacion.destroy

    redirect_back fallback_location: root_path
  end
end
