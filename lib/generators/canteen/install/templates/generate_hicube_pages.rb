class GenerateHicubePages < Mongoid::Migration
  def self.up
    puts "Creating Hicube Pages"
    Hicube::Page.create!(title: 'About', body: '*This is bold text*')
  end

  def self.down
    pages = Hicube::Page.where(title: 'About')
    return if pages.nil? || pages.empty?
    pages.each do |page|
      page.delete
    end
  end
end