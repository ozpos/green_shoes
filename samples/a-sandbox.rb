Shoes.app margin: 0, width: 400, resizable: true, title: "f0 600 x 200, f1m10, f2,f3,f4=33% b1-9mt10mb10" do
  flow width: 1.0, align: "left" do
    stack align: "left" do
      flow width: 1.0, align:"left" do
        background tan
        caption "A Gentle Reminder", :margin => 8, :stroke => white
      end
      flow width: 1.0, align:"left" do
        background white
        @add = edit_line "", margin:10
        button("Add a task", height:30, margin:10)  { add_todo(@add.text); @add.text = '' }
      end
      flow width: 1.0, align:"left" do
        background darkgray
        para strong("To Do"), :margin => 8, :stroke => white
      end
      stack width: 1.0 do
        flow width: 1.0, align: "left" do
          background white
          border blue
          @gui_todo = para
         # button "B1 f1", height:30, width:60, margin: 5
         # button "B2 f1", height:30, width:70, margin: 5
         # button "B3 f1", height:30, width:80, margin: 5
        end
      end
        edit_box "This is a parograph", align: "right"
        flow margin:20, width: 0.3333, align: "center" do
          background "#ccddff"
          border black
          button "B1 f2", height:30, width:60, margin: 5
          button "B2 f2", height:30, width:70, margin: 5
          button "B3 f2", height:30, width:80, margin: 5
        end
        flow margin:20, width: 0.3333, align: "right" do
          background "#ddffcc"
          border blue
          button "B1 f3", height:30, width:60, margin: 5
          button "B2 f3", height:30, width:70, margin: 5
          button "B3 f3", height:30, width:80, margin: 5
        end

      flow width: 0.8 do
        flow margin: 0, width: 0.6, align:"left" do
          background "#eeeeee"
          flow margin:10, width: 0.2, align: "left" do
            background "#ffccdd"
            border blue
            button "B1 f1", height:30, width:60, margin: 5
            button "B2 f1", height:30, width:70, margin: 5
            button "B3 f1", height:30, width:80, margin: 5
          end
          flow margin:10, width: 0.2, align: "center" do
            background "#ccddff"
            border black
            button "B1 f2", height:30, width:60, margin: 5
            button "B2 f2", height:30, width:70, margin: 5
            button "B3 f2", height:30, width:80, margin: 5
          end
          edit_line "Edit this line of text"
          flow margin:10, width: 0.2, align: "right" do
            background "#ddffcc"
            border blue
            button "B1 f3", height:30, width:60, margin: 5
            button "B2 f3", height:30, width:70, margin: 5
            button "B3 f3", height:30, width:80, margin: 5
          end
        end
        flow margin: 0, width: 0.4, align:"right" do
          background "#aaaaaa"
          flow margin:10, width: 0.3333, align: "left" do
            background "#ffccdd"
            border blue
            button "B1 f1", height:30, width:60, margin: 5
            button "B2 f1", height:30, width:70, margin: 5
            button "B3 f1", height:30, width:80, margin: 5
          end
          flow margin:10, width: 0.3333, align: "center" do
            background "#ccddff"
            border black
            button "B1 f2", height:30, width:60, margin: 5
            button "B2 f2", height:30, width:70, margin: 5
            button "B3 f2", height:30, width:80, margin: 5
          end
          flow margin:10, width: 0.3333, align: "right" do
            background "#ddffcc"
            border blue
            button "B1 f3", height:30, width:60, margin: 5
            button "B2 f3", height:30, width:70, margin: 5
            button "B3 f3", height:30, width:80, margin: 5
          end
        end
      end
    end
  end
  @gui_completed = stack :width => 1.0, :height => 207, :margin => 20


  def data_path
    if RUBY_PLATFORM =~ /win32/
      if ENV['USERPROFILE']
        if File.exist?(File.join(File.expand_path(ENV['USERPROFILE']), "Application Data"))
          user_data_directory = File.join File.expand_path(ENV['USERPROFILE']), "Application Data", "GentleReminder"
        else
          user_data_directory = File.join File.expand_path(ENV['USERPROFILE']), "GentleReminder"
        end
      else
        user_data_directory = File.join File.expand_path(Dir.getwd), "data"
      end
    else
      user_data_directory = File.expand_path(File.join("~", ".gentlereminder"))
    end

    unless File.exist?(user_data_directory)
      Dir.mkdir(user_data_directory)
    end

    return File.join(user_data_directory, "data.yaml")
  end


  def refresh_todo
    @gui_todo.replace *(
                      @todo.map { |item|
                        [ item, '  ' ] + [ link('Done') { complete_todo item } ] + [ '  ' ] +
                            [ link('Forget it') { forget_todo item } ] + [ "\n" ]
                      }.flatten
                      )
  end


  def refresh
    refresh_todo

    @gui_completed.clear

    @gui_completed.append do
      background white

      @completed.keys.sort.reverse.each { |day|
        stack do
          background lightgrey
          para strong(Time.at(day).strftime('%B %d, %Y')), :stroke => white
        end

        stack do
          inscription *(
                      @completed[day].map { |item|
                        [ item ] + [ '  ' ] + [ link('Not Done') { undo_todo day, item } ] +
                            (@completed[day].index(item) == @completed[day].length - 1 ? [ '' ] : [ "\n" ])
                      }.flatten
                      )
        end

      }
    end
  end

def complete_todo(item)
  day = Date.today

  if @completed.keys.include? day
    @completed[day] << item
  else
    @completed[day] = [ item ]
  end

  @todo.delete(item)

  save

  refresh
end


def undo_todo(day, item)
  @completed[day].delete item

  @completed.delete(day) if @completed[day].empty?

  @todo << item unless @todo.include? item

  save

  refresh
end


def add_todo(item)
  item = item.strip

  return if item == ''

  if @todo.include? item
    alert('You have already added that to the list!')
    return
  end

  @todo << item

  save

  refresh_todo
end


def forget_todo(item)
  @todo.delete item

  save

  refresh_todo
end


def load
  if File.exist?(data_path)
    @todo, @completed = YAML::load(File.open(data_path, 'r'))
  else
    @todo = []
    @completed = {}
  end

  refresh
end


def save
  File.open(data_path, 'w') { |f|
    f.write [ @todo, @completed ].to_yaml
  }
end


load

end