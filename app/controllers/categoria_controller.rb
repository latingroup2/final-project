class CategoriaController < ApplicationController
  def index
    @categoria = Categorium.all

    render("categorium_templates/index.html.erb")
  end

  def show
    @categorium = Categorium.find(params.fetch("id_to_display"))

    render("categorium_templates/show.html.erb")
  end

  def new_form
    render("categorium_templates/new_form.html.erb")
  end

  def create_row
    @categorium = Categorium.new

    @categorium.descripcion = params.fetch("descripcion")
    @categorium.eje_id = params.fetch("eje_id")

    if @categorium.valid?
      @categorium.save

      redirect_to("/categoria", :notice => "Categorium created successfully.")
    else
      render("categorium_templates/new_form.html.erb")
    end
  end

  def edit_form
    @categorium = Categorium.find(params.fetch("prefill_with_id"))

    render("categorium_templates/edit_form.html.erb")
  end

  def update_row
    @categorium = Categorium.find(params.fetch("id_to_modify"))

    @categorium.descripcion = params.fetch("descripcion")
    @categorium.eje_id = params.fetch("eje_id")

    if @categorium.valid?
      @categorium.save

      redirect_to("/categoria/#{@categorium.id}", :notice => "Categorium updated successfully.")
    else
      render("categorium_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @categorium = Categorium.find(params.fetch("id_to_remove"))

    @categorium.destroy

    redirect_to("/categoria", :notice => "Categorium deleted successfully.")
  end
end
