class ContenidosController < ApplicationController
  def index
    @contenidos = Contenido.all

    render("contenido_templates/index_especifico.html.erb")
  end

  def show
    @contenido = Contenido.find(params.fetch("id_to_display"))

    render("contenido_templates/show.html.erb")
  end
  
  def ver_especifico
      render("contenido_templates/index_especifico.html.erb")
  end
  
  def ver_avanzar
    render("contenido_templates/index_avanzar.html.erb")
  end

  def new_form
    render("contenido_templates/new_form.html.erb")
  end

  def create_row
    @contenido = Contenido.new

    @contenido.nombre = params.fetch("nombre")
    @contenido.anterior = params.fetch("anterior")
    @contenido.siguiente = params.fetch("siguiente")
    @contenido.categoria_id = params.fetch("categoria_id")

    if @contenido.valid?
      @contenido.save

      redirect_to("/contenidos", :notice => "Contenido created successfully.")
    else
      render("contenido_templates/new_form.html.erb")
    end
  end

  def edit_form
    @contenido = Contenido.find(params.fetch("prefill_with_id"))

    render("contenido_templates/edit_form.html.erb")
  end

  def update_row
    @contenido = Contenido.find(params.fetch("id_to_modify"))

    @contenido.nombre = params.fetch("nombre")
    @contenido.anterior = params.fetch("anterior")
    @contenido.siguiente = params.fetch("siguiente")
    @contenido.categoria_id = params.fetch("categoria_id")

    if @contenido.valid?
      @contenido.save

      redirect_to("/contenidos/#{@contenido.id}", :notice => "Contenido updated successfully.")
    else
      render("contenido_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @contenido = Contenido.find(params.fetch("id_to_remove"))

    @contenido.destroy

    redirect_to("/contenidos", :notice => "Contenido deleted successfully.")
  end
end
