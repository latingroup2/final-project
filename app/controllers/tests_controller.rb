class TestsController < ApplicationController
  def index
    @tests = Test.all

    render("test_templates/index.html.erb")
  end
  
  def index_prof
    @tests = Test.where(profesor_id: current_profesor.id)

    render("test_templates/index_prof.html.erb")
  end

  def show
    @test = Test.find(params.fetch("id_to_display"))

    render("test_templates/show.html.erb")
  end

  def new_form
    render("test_templates/new_form.html.erb")
  end

  def create_row
    @test = Test.new

    @test.profesor_id = params.fetch("profesor_id")

    if @test.valid?
      @test.save

      redirect_to("/tests/#{@test.id}/edit", :notice => "Test created successfully.")
    else
      render("test_templates/new_form.html.erb")
    end
  end

  def edit_form
    @test = Test.find(params.fetch("prefill_with_id"))

    render("test_templates/edit_form.html.erb")
  end

  def update_row
    @test = Test.find(params.fetch("id_to_modify"))

    @test.profesor_id = params.fetch("profesor_id")
    @test.nombre = params.fetch("nombre_test")

    if @test.valid?
      @test.save

      redirect_back fallback_location: root_path
    else
      render("test_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @test = Test.find(params.fetch("id_to_remove"))

    @test.destroy

    redirect_back fallback_location: root_path
  end
end
