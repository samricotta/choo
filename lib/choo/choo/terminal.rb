module Terminal
  module_function

  def screen_size
    TermInfo.screen_size
  end

  def screen_width
    screen_size[1]
  end

  def return_to_beginning_of_line
    print "\e[0G"
  end

  def clear_screen_from_cursor
    print "\e[0J"
  end

  def hide_cursor
    print "\e[?25l"
  end

  def show_cursor
    print "\e[?25h"
  end
end
