class AddTestRunToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :test_run, :string

    Result.all.each do |result|
      result.update!(test_run: 'already happened')
    end

    change_column :results, :test_run, :string, null: false
  end
end
