class ObjetivosController < ApplicationController
  def index
    @objetivos = Objetivo.all

    render("objetivo_templates/index.html.erb")
  end

  def show
    @objetivo = Objetivo.find(params.fetch("id_to_display"))

    render("objetivo_templates/show.html.erb")
  end

  def new_form
    render("objetivo_templates/new_form.html.erb")
  end

  def create_row
    @objetivo = Objetivo.new

    @objetivo.eje_id = params.fetch("eje_id")
    @objetivo.descripcion = params.fetch("descripcion")
    @objetivo.numeral = params.fetch("numeral")

    if @objetivo.valid?
      @objetivo.save

      redirect_to("/objetivos", :notice => "Objetivo created successfully.")
    else
      render("objetivo_templates/new_form.html.erb")
    end
  end

  def edit_form
    @objetivo = Objetivo.find(params.fetch("prefill_with_id"))

    render("objetivo_templates/edit_form.html.erb")
  end

  def update_row
    @objetivo = Objetivo.find(params.fetch("id_to_modify"))

    @objetivo.eje_id = params.fetch("eje_id")
    @objetivo.descripcion = params.fetch("descripcion")
    @objetivo.numeral = params.fetch("numeral")

    if @objetivo.valid?
      @objetivo.save

      redirect_to("/objetivos/#{@objetivo.id}", :notice => "Objetivo updated successfully.")
    else
      render("objetivo_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @objetivo = Objetivo.find(params.fetch("id_to_remove"))

    @objetivo.destroy

    redirect_to("/objetivos", :notice => "Objetivo deleted successfully.")
  end
end
