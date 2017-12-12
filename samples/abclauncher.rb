require 'yaml'

Shoes.app :title => "App Samples Status" do
  @menu = stack margin: 10 do
    #background #dddddd
    title 'Sample Evaluation'
    flow border: 1.5 do
      @reload = button('reload'){ t.replace "reload"}
      @save = button 'save' do alert 'save' end
    end
    t = para 'Please select'
  end

  samples_dir = "samples"
  samples_all = Dir.entries("#{samples_dir}").sort
  samples=[]
  samples_all.each_index do |i|
    samples << {name: samples_all[i],desc: "", ok: false} if !(samples_all[i] =~ /\.rb$/).nil?
  end
#  button "Refresh" {@s.c}
  @s = stack do
    samples.each do |s|
      stack do
        flow do
          button(s[:name]) do
          #  Shoes.app do
              load "#{samples_dir}/#{s[:name]}"
           #   end
          end
        end
     end
    end

  end
end
