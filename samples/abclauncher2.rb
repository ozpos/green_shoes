require 'yaml'
#require 'green_shoes'

Shoes.app :title => "App Samples Status - launch an app",width: 600 do
  stack width:0.99 do
    samples_dir = "samples"
    all_filenames_sorted = Dir.entries("#{samples_dir}").sort
    @samples_found=[]
    @b=[]
    @backgrounds=[]
    @jobs=[]
    @passes=[]
    @failures=[]
    @descriptions=[]
    @JobFlow=[]
    @sample_status = Struct.new("SampleStatus", :name, :desc, :ok)
    all_filenames_sorted.each_index do |i|
      if !(all_filenames_sorted[i] =~ /\.rb$/).nil?
        @samples_found << @sample_status.new( name: all_filenames_sorted[i], desc: "", ok: false)
      end
    end
    @p=caption "Click to run"
    flow align:"right" do
      button "Save" do
        save_jobs
      end
      button "Save and Exit" do
        save_jobs
        exit 0
      end
      button "Exit" do
        exit 0
      end
    end
    stack do
      flow do
        @PassCount=edit_line(width:30 ){}
        para("Passed",width:70,margin: 5){}
        @FailCount=edit_line(width:30 ){}
        para("Failed",width:120,margin: 5){}

        radio(:grouping,margin: 5,checked: true) do
        end
        para "All",width:20,margin: 5
        radio(:grouping,margin: 5) do
    #      @jobs.each_with_index do |job, i|
     #       @JobFlow[i].hidden=!job.pass
    #      end

        end
        para "Passed",width:60,margin: 5

        radio(:grouping,margin: 5) do
        end
        para "Failed",width:60,margin: 5
      end
      @samples_found.each_with_index do |s,i|
        @JobFlow[i] = flow align: "center", width: 1.0 do
         # @backgrounds[i] = background (s[:name] == @p.text ? red : lightgrey)
          #border 1
          flow align: "right",width:0.25 do
            @b[i] = border (s[:name] == @p.text ? red : lightgrey),strokewidth: 5 #unless @p.text == "Click to run"
            button(s[:name]) do
              @p.text=s[:name]

             # @b.color = grey
             # @backgrounds[i].background = grey
              @b[i].style fill: send( :red),strokewidth:10,stroke: send(:pink),curve:10
          #    @backgrounds[i].style fill: red
              save_jobs
              load "#{samples_dir}/#{s[:name]}"
              #alert @p.text
            end
          end
          flow align: "left",width:0.7 do
            flow width: 40 do
              @passes[i]=radio(s[:name]) do
                @jobs[i].pass = true
                update_counts
                save_jobs
              end
              para "Pass",width:40
            end
            flow width:40 do
              @failures[i]=radio(s[:name]) do
                @jobs[i].pass = false
                update_counts
                save_jobs
              end
              para "Fail",width:40
            end
            @descriptions[i]=edit_box(height:40,width:300,margin_top:4) do |e|
              @jobs[i].desc= e.text
            end
          end
        end
      end
    end

  end
  def update_counts
    p=f=0
    @jobs.each_with_index do |job, i|
      p+=1 if job.pass
      f+=1 if !job.pass
    end
    @PassCount.text=p.to_s
    @FailCount.text=f.to_s
  end
  def update_gui
    p=f=0
    @jobs.each_with_index do |job, i|
      @passes[i].checked=job.pass
      @failures[i].checked=!job.pass
      p+=1 if job.pass
      f+=1 if !job.pass
      @descriptions[i].text=job.desc
    end
    @PassCount.text=p.to_s
    @FailCount.text=f.to_s
  end

  def data_path
    if RUBY_PLATFORM =~ /win32/
      if ENV['USERPROFILE']
        if File.exist?(File.join(File.expand_path(ENV['USERPROFILE']), "Application Data"))
          user_data_directory = File.join File.expand_path(ENV['USERPROFILE']), "Application Data", "GentleReminder"
        else
          user_data_directory = File.join File.expand_path(ENV['USERPROFILE']), "GentleReminder"
        end
      else
        user_data_directory = File.join File.expand_path(Dir.getwd), "jobs"
      end
    else
      user_data_directory = File.expand_path(File.join("~", ".gentlereminder"))
    end

    unless File.exist?(user_data_directory)
      Dir.mkdir(user_data_directory)
    end

    return File.join(user_data_directory, "jobs.yaml")
  end

  def load_jobs
    if File.exist?(data_path)
##      # Psudo code
##      tS=Struct.new(:p,:n,:v)
##      x=[]
##      jt=[]
##      j=[]
##      t=[]
##      j<<tS.new(false,'one',1)
##      j<<tS.new(false,'two',2)
##      j<<tS.new(false,'three',3)
##      t<<tS.new(true,'one',1.0)
##      t<<tS.new(true,'three',3.0)
##
##      j.each do |a|
##        x=t.select do |b|
##          b.n==a.n
##        end
##        if x.empty?
##          jt<<a
##        else
##          jt<<x.first
##        end
##      #  break
##      end
      # Merge the last saved settings with the current file list.
      # Note they may not correspont so keep all settings existing files
      # and any new files will receive defaults of "fail" and desc="" etc.
      job_settings =[]
      previously_saved_jobs = YAML::load(File.open(data_path, 'r'))
      jobs_merged_settings = []
      @jobs.each do |a|
        has_setting = a.select do |b|
          b.name == a.name
        end
        if has_setting.empty?
          jobs_merged_settings << a
        else
          jobs_merged_settings << has_setting.first
        end
      end
      @jobs = jobs_merged_settings
      update_gui
    else
      save_jobs
    end
  end


  def save_jobs
    File.open(data_path, 'w') { |f|
      f.write @jobs.to_yaml
    }
  end


  load_jobs


end
