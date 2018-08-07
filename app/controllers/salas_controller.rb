class SalasController < ApplicationController
  def index
    @salas = Sala.all

    render("sala_templates/index.html.erb")
  end
  
  def index_prof
    @salas = Sala.where("profesor_id == ?", current_profesor.id)

    render("sala_templates/index_prof.html.erb")
  end



  def show
    @sala = Sala.find(params.fetch("id_to_display"))

    render("sala_templates/show.html.erb")
  end

  def new_form
    render("sala_templates/new_form.html.erb")
  end

  def create_row
    @sala = Sala.new

    @sala.profesor_id = params.fetch("profesor_id")
    @sala.colegio_id = params.fetch("colegio_id")

    if @sala.valid?
      @sala.save

      redirect_to("/salas", :notice => "Sala created successfully.")
    else
      render("sala_templates/new_form.html.erb")
    end
  end

  def edit_form
    @sala = Sala.find(params.fetch("prefill_with_id"))

    render("sala_templates/edit_form.html.erb")
  end

  def update_row
    @sala = Sala.find(params.fetch("id_to_modify"))

    @sala.profesor_id = params.fetch("profesor_id")
    @sala.colegio_id = params.fetch("colegio_id")

    if @sala.valid?
      @sala.save

      redirect_to("/salas/#{@sala.id}", :notice => "Sala updated successfully.")
    else
      render("sala_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @sala = Sala.find(params.fetch("id_to_remove"))

    @sala.destroy

    redirect_to("/salas", :notice => "Sala deleted successfully.")
  end
end
