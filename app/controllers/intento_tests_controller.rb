class IntentoTestsController < ApplicationController
  def index
    @intento_tests = IntentoTest.all

    render("intento_test_templates/index.html.erb")
  end

  def show
    @intento_test = IntentoTest.find(params.fetch("id_to_display"))

    render("intento_test_templates/show.html.erb")
  end

  def new_form
    render("intento_test_templates/new_form.html.erb")
  end

  def create_row
    @intento_test = IntentoTest.new

    @intento_test.test_id = params.fetch("test_id")
    @intento_test.user_id = params.fetch("user_id")

    if @intento_test.valid?
      @intento_test.save

      redirect_to("/intento_tests", :notice => "Intento test created successfully.")
    else
      render("intento_test_templates/new_form.html.erb")
    end
  end

  def edit_form
    @intento_test = IntentoTest.find(params.fetch("prefill_with_id"))

    render("intento_test_templates/edit_form.html.erb")
  end

  def update_row
    @intento_test = IntentoTest.find(params.fetch("id_to_modify"))

    @intento_test.test_id = params.fetch("test_id")
    @intento_test.user_id = params.fetch("user_id")

    if @intento_test.valid?
      @intento_test.save

      redirect_to("/intento_tests/#{@intento_test.id}", :notice => "Intento test updated successfully.")
    else
      render("intento_test_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @intento_test = IntentoTest.find(params.fetch("id_to_remove"))

    @intento_test.destroy

    redirect_to("/intento_tests", :notice => "Intento test deleted successfully.")
  end
end
