class ColegiosController < ApplicationController
  def index
    @colegios = Colegio.all

    render("colegio_templates/index.html.erb")
  end

  def show
    @colegio = Colegio.find(params.fetch("id_to_display"))

    render("colegio_templates/show.html.erb")
  end

  def new_form
    render("colegio_templates/new_form.html.erb")
  end

  def create_row
    @colegio = Colegio.new

    @colegio.nombre = params.fetch("nombre")

    if @colegio.valid?
      @colegio.save

      redirect_to("/colegios", :notice => "Colegio created successfully.")
    else
      render("colegio_templates/new_form.html.erb")
    end
  end

  def edit_form
    @colegio = Colegio.find(params.fetch("prefill_with_id"))

    render("colegio_templates/edit_form.html.erb")
  end

  def update_row
    @colegio = Colegio.find(params.fetch("id_to_modify"))

    @colegio.nombre = params.fetch("nombre")

    if @colegio.valid?
      @colegio.save

      redirect_to("/colegios/#{@colegio.id}", :notice => "Colegio updated successfully.")
    else
      render("colegio_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @colegio = Colegio.find(params.fetch("id_to_remove"))

    @colegio.destroy

    redirect_to("/colegios", :notice => "Colegio deleted successfully.")
  end
end
