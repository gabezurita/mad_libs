class SolutionsController < ApplicationController
  def show
    @mad_lib = MadLib.find(params[:mad_lib_id])
    @solution = @mad_lib.solutions.find(params[:id])
    @resolved_mad_lib = @solution.resolve
  end

  def create
    @mad_lib = MadLib.find(params[:mad_lib_id])
    @solution = @mad_lib.solutions.new
    # in order to send values from create form to show, have to serialize
    @solution.set_values_from_params(params[:solution])

    if @solution.save
      flash[:notice] = 'Your solution has been created'
      redirect_to [@mad_lib, @solution]
    else
      render 'new'
    end
  end
end
