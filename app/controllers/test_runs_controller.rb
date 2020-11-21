# frozen_string_literal: true

# test runs controller
class TestRunsController < ApplicationController
  def index
    @test_runs = Result.test_runs
  end

  def show
    time = params[:id].to_datetime.strftime('%s')
    @test_run_results = Result.test_run(time)
  end
end
