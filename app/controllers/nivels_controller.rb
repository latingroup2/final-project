class NivelsController < ApplicationController
  def index
    @nivels = Nivel.all

    render("nivel_templates/index.html.erb")
  end

  def show_alumno
    @alumno = User.find(params.fetch("id_to_display"))
    @puns = [@alumno.nivels.last.puntajes.where(categoria_id: 1).last.score, @alumno.nivels.last.puntajes.where(categoria_id: 2).last.score]

    render("nivel_templates/show_alumno.html.erb")
  end

  def show
    @nivel = Nivel.find(params.fetch("id_to_display"))

    render("nivel_templates/show.html.erb")
  end

  def new_form
    render("nivel_templates/new_form.html.erb")
  end

  def create_row
    @nivel = Nivel.new

    @nivel.user_id = params.fetch("user_id")

    if @nivel.valid?
      @nivel.save

      redirect_to("/nivels", :notice => "Nivel created successfully.")
    else
      render("nivel_templates/new_form.html.erb")
    end
  end

  def edit_form
    @nivel = Nivel.find(params.fetch("prefill_with_id"))

    render("nivel_templates/edit_form.html.erb")
  end

  def update_row
    @nivel = Nivel.find(params.fetch("id_to_modify"))

    @nivel.user_id = params.fetch("user_id")

    if @nivel.valid?
      @nivel.save

      redirect_to("/nivels/#{@nivel.id}", :notice => "Nivel updated successfully.")
    else
      render("nivel_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @nivel = Nivel.find(params.fetch("id_to_remove"))

    @nivel.destroy

    redirect_to("/nivels", :notice => "Nivel deleted successfully.")
  end
end
