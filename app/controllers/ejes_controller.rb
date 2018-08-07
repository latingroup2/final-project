class EjesController < ApplicationController
  def index
    @ejes = Eje.all

    render("eje_templates/index.html.erb")
  end

  def show
    @eje = Eje.find(params.fetch("id_to_display"))

    render("eje_templates/show.html.erb")
  end

  def new_form
    render("eje_templates/new_form.html.erb")
  end

  def create_row
    @eje = Eje.new

    @eje.materia_id = params.fetch("materia_id")
    @eje.description = params.fetch("description")

    if @eje.valid?
      @eje.save

      redirect_to("/ejes", :notice => "Eje created successfully.")
    else
      render("eje_templates/new_form.html.erb")
    end
  end

  def edit_form
    @eje = Eje.find(params.fetch("prefill_with_id"))

    render("eje_templates/edit_form.html.erb")
  end

  def update_row
    @eje = Eje.find(params.fetch("id_to_modify"))

    @eje.materia_id = params.fetch("materia_id")
    @eje.description = params.fetch("description")

    if @eje.valid?
      @eje.save

      redirect_to("/ejes/#{@eje.id}", :notice => "Eje updated successfully.")
    else
      render("eje_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @eje = Eje.find(params.fetch("id_to_remove"))

    @eje.destroy

    redirect_to("/ejes", :notice => "Eje deleted successfully.")
  end
end
