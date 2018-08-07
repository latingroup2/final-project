class TributosController < ApplicationController
  def index
    @tributos = Tributo.all

    render("tributo_templates/index.html.erb")
  end

  def show
    @tributo = Tributo.find(params.fetch("id_to_display"))

    render("tributo_templates/show.html.erb")
  end

  def new_form
    render("tributo_templates/new_form.html.erb")
  end

  def create_row
    @tributo = Tributo.new

    @tributo.contenido_name = params.fetch("contenido_name")
    @tributo.contenido_id = params.fetch("contenido_id")
    @tributo.indicador_name = params.fetch("indicador_name")
    @tributo.indicador_id = params.fetch("indicador_id")

    if @tributo.valid?
      @tributo.save

      redirect_to("/tributos", :notice => "Tributo created successfully.")
    else
      render("tributo_templates/new_form.html.erb")
    end
  end

  def edit_form
    @tributo = Tributo.find(params.fetch("prefill_with_id"))

    render("tributo_templates/edit_form.html.erb")
  end

  def update_row
    @tributo = Tributo.find(params.fetch("id_to_modify"))

    @tributo.contenido_name = params.fetch("contenido_name")
    @tributo.contenido_id = params.fetch("contenido_id")
    @tributo.indicador_name = params.fetch("indicador_name")
    @tributo.indicador_id = params.fetch("indicador_id")

    if @tributo.valid?
      @tributo.save

      redirect_to("/tributos/#{@tributo.id}", :notice => "Tributo updated successfully.")
    else
      render("tributo_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @tributo = Tributo.find(params.fetch("id_to_remove"))

    @tributo.destroy

    redirect_to("/tributos", :notice => "Tributo deleted successfully.")
  end
end
