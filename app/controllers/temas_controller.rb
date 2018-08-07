class TemasController < ApplicationController
  def index
    @temas = Tema.all

    render("tema_templates/index.html.erb")
  end

  def show
    @tema = Tema.find(params.fetch("id_to_display"))

    render("tema_templates/show.html.erb")
  end

  def new_form
    render("tema_templates/new_form.html.erb")
  end

  def create_row
    @tema = Tema.new

    @tema.nombre = params.fetch("nombre")

    if @tema.valid?
      @tema.save

      redirect_to("/temas", :notice => "Tema created successfully.")
    else
      render("tema_templates/new_form.html.erb")
    end
  end

  def edit_form
    @tema = Tema.find(params.fetch("prefill_with_id"))

    render("tema_templates/edit_form.html.erb")
  end

  def update_row
    @tema = Tema.find(params.fetch("id_to_modify"))

    @tema.nombre = params.fetch("nombre")

    if @tema.valid?
      @tema.save

      redirect_to("/temas/#{@tema.id}", :notice => "Tema updated successfully.")
    else
      render("tema_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @tema = Tema.find(params.fetch("id_to_remove"))

    @tema.destroy

    redirect_to("/temas", :notice => "Tema deleted successfully.")
  end
end
