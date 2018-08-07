class IndicatorsController < ApplicationController
  def index
    @indicators = Indicator.all

    render("indicator_templates/index.html.erb")
  end

  def show
    @indicator = Indicator.find(params.fetch("id_to_display"))

    render("indicator_templates/show.html.erb")
  end

  def new_form
    render("indicator_templates/new_form.html.erb")
  end

  def create_row
    @indicator = Indicator.new

    @indicator.objetivo_id = params.fetch("objetivo_id")
    @indicator.descripcion = params.fetch("descripcion")
    @indicator.numeral = params.fetch("numeral")

    if @indicator.valid?
      @indicator.save

      redirect_to("/indicators", :notice => "Indicator created successfully.")
    else
      render("indicator_templates/new_form.html.erb")
    end
  end

  def edit_form
    @indicator = Indicator.find(params.fetch("prefill_with_id"))

    render("indicator_templates/edit_form.html.erb")
  end

  def update_row
    @indicator = Indicator.find(params.fetch("id_to_modify"))

    @indicator.objetivo_id = params.fetch("objetivo_id")
    @indicator.descripcion = params.fetch("descripcion")
    @indicator.numeral = params.fetch("numeral")

    if @indicator.valid?
      @indicator.save

      redirect_to("/indicators/#{@indicator.id}", :notice => "Indicator updated successfully.")
    else
      render("indicator_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @indicator = Indicator.find(params.fetch("id_to_remove"))

    @indicator.destroy

    redirect_to("/indicators", :notice => "Indicator deleted successfully.")
  end
end
