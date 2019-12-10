# frozen_string_literal: true

class Train
  TRAIN = "🚂 "
  CARRIAGE = "🚃 "
  ANIMATION_RATE = 0.025

  def initialize(carriages_count)
    @train = TRAIN + (CARRIAGE * carriages_count)
    @train_length = 3 + (3 * carriages_count)
    @moves = 0
  end

  def choo
    Terminal.hide_cursor
    loop do
      Terminal.return_to_beginning_of_line
      Terminal.clear_screen_from_cursor
      print_train
      pause
      move_left
    end
  ensure
    Terminal.show_cursor
  end

  private

  attr_reader :train,
              :train_length

  def pause
    sleep(ANIMATION_RATE)
  end

  def print_train
    space_count = Terminal.screen_width - @moves -1

    if space_count < 0
      print(train[space_count.abs..-1])
    else
      print(" " * space_count)

      cut_off = Terminal.screen_width - (train_length + space_count)
      cut_off = 0 if cut_off > -1
      end_of_train = -1 + cut_off
      print(train[0..end_of_train])
    end
  end

  def move_left
    @moves += 1
    @moves = 0 if @moves > Terminal.screen_width + train_length
  end
end
