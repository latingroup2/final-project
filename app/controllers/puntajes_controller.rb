class PuntajesController < ApplicationController
  def index
    @puntajes = Puntaje.all

    render("puntaje_templates/index.html.erb")
  end

  def show
    @puntaje = Puntaje.find(params.fetch("id_to_display"))

    render("puntaje_templates/show.html.erb")
  end

  def new_form
    render("puntaje_templates/new_form.html.erb")
  end

  def create_row
    @puntaje = Puntaje.new

    @puntaje.nivel_id = params.fetch("nivel_id")
    @puntaje.categoria_id = params.fetch("categoria_id")
    @puntaje.score = params.fetch("score")

    if @puntaje.valid?
      @puntaje.save

      redirect_to("/puntajes", :notice => "Puntaje created successfully.")
    else
      render("puntaje_templates/new_form.html.erb")
    end
  end

  def edit_form
    @puntaje = Puntaje.find(params.fetch("prefill_with_id"))

    render("puntaje_templates/edit_form.html.erb")
  end

  def update_row
    @puntaje = Puntaje.find(params.fetch("id_to_modify"))

    @puntaje.nivel_id = params.fetch("nivel_id")
    @puntaje.categoria_id = params.fetch("categoria_id")
    @puntaje.score = params.fetch("score")

    if @puntaje.valid?
      @puntaje.save

      redirect_to("/puntajes/#{@puntaje.id}", :notice => "Puntaje updated successfully.")
    else
      render("puntaje_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @puntaje = Puntaje.find(params.fetch("id_to_remove"))

    @puntaje.destroy

    redirect_to("/puntajes", :notice => "Puntaje deleted successfully.")
  end
end
