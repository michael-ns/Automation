class CreateEnvs < ActiveRecord::Migration
  def change
    create_table :envs do |t|
      t.string :domain
      t.string :live_or_staging

      t.timestamps
    end
  end
end
