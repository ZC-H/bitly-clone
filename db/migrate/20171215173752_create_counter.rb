class CreateCounter < ActiveRecord::Migration[5.0]
	def change
		add_column :urls, :clicked, :integer
		Url.all.each do |url|
      url.update(clicked: 0)
    end
	end
end
