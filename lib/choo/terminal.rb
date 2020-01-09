module Terminal
  module_function

  def columns
    ENV['COLUMNS']&.to_i || IO.console.winsize[1] || 80
  end

  def rows
    ENV['LINES']&.to_i || IO.console.winsize[0] || 24
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

  def save_position_of_cursor
    print "\e[s"
  end

  def restore_position_of_cursor
    print "\e[u"
  end
end
