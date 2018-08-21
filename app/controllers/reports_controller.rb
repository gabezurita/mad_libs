class ReportsController < ApplicationController
  def index
    @mad_libs_report = MadLib.count_report_fields
    @solutions_report = Solution.count_report_fields
  end
end
