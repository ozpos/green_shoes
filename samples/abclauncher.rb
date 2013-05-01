require 'yaml'

Shoes.app :title => "App Samples Status" do
  samples_dir = "samples"
  samples_all = Dir.entries("#{samples_dir}").sort
  samples=[]
  samples_all.each_index do |i|
    samples << {name: samples_all[i],desc: "", ok: false} if !(samples_all[i] =~ /\.rb$/).nil?
  end

  stack do
    samples.each do |s|
      stack do
          button(s[:name]) do
            load "#{samples_dir}/#{s[:name]}"
          end
     end
    end

  end
end
