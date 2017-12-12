class SpinButton < Shoes::Widget
  def initialize(args={})
    args[:val] ||= 128
    args[:max] ||= 255
    args[:min] ||= 1
    args[:align] ||= 'center'
    min_width = 34
    @stack = true
    @min = args[:min]
    @max = args[:max]
    @val = check_range(args[:val])

    if self.cslot.is_a?(Shoes::Stack) then
      @slot = stack( margin: 2, width: min_width + 4) do #@max_width + 4) do
        background lightgrey, curve: 5
        border gray, curve: 5
        @bp = button "+", width: min_width, margin_top: 0
        @p = edit_line text: @val, align: args[:align], width: args[:max].to_s.size * -1, margin_top: 0 do
          @val = @p.text.to_i
        end
        @bm = button "-", width: min_width
      end
    else
      @stack = false
      @slot = flow( margin: 2, width: min_width * 3 + 4) do
        background lightgrey, curve: 5
        border gray, curve: 5
        @bp = button "+", width: min_width, margin_top: 0
        @p = edit_line text: @val, align: args[:align], width: args[:max].to_s.size * -1, margin_top: 0 do
          @val = @p.text.to_i
        end
        @bm = button "-", width: min_width
      end
    end
    # Resize to edit_line width
    if @stack then
      @slot.contents[2].style(width: @p.width )
      @slot.contents[4].style(width: @p.width )
      @slot.width = @p.width + 4
    else
      @slot.width = min_width * 2 + @p.width + 4
    end

    @bp.click do
      @val = check_range( @val + 1)
      @p.text= @val.to_s
    end

    @bm.click do
      @val = check_range( @val - 1)
      @p.text= @val.to_s
    end
  end
  def value
    val
  end
  private
  def check_range v
    if v > @max then
      @max
    elsif v < @min then
      @min
    else
      v
    end
  end
end