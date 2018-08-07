class TriesController < ApplicationController
  def index
    @tries = Try.all

    render("try_templates/index.html.erb")
  end

  def show
    @try = Try.find(params.fetch("id_to_display"))

    render("try_templates/show.html.erb")
  end

  def new_form
    render("try_templates/new_form.html.erb")
  end

  def create_row
    @try = Try.new

    @try.user_id = params.fetch("user_id")
    @try.excercise_id = params.fetch("excercise_id")
    @try.user_answer = params.fetch("user_answer")
    @try.correct = params.fetch("correct")
    @try.active = params.fetch("active")
    @try.intento_guia_id = params.fetch("intento_guia_id")

    if @try.valid?
      @try.save

      redirect_to("/tries", :notice => "Try created successfully.")
    else
      render("try_templates/new_form.html.erb")
    end
  end

  def edit_form
    @try = Try.find(params.fetch("prefill_with_id"))

    render("try_templates/edit_form.html.erb")
  end

  def update_row
    @try = Try.find(params.fetch("id_to_modify"))

    @try.user_id = params.fetch("user_id")
    @try.excercise_id = params.fetch("excercise_id")
    @try.user_answer = params.fetch("user_answer")
    @try.correct = params.fetch("correct")
    @try.active = params.fetch("active")
    @try.intento_guia_id = params.fetch("intento_guia_id")

    if @try.valid?
      @try.save

      redirect_to("/tries/#{@try.id}", :notice => "Try updated successfully.")
    else
      render("try_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @try = Try.find(params.fetch("id_to_remove"))

    @try.destroy

    redirect_to("/tries", :notice => "Try deleted successfully.")
  end
end
