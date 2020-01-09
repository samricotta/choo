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

  def show
    hide if @thread
    Terminal.save_position_of_cursor
    @thread = Thread.new do
      choo
    end
  end

  def hide
    Terminal.restore_position_of_cursor
    @thread.kill
  end

  private

  attr_reader :train,
              :train_length

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

  def pause
    sleep(ANIMATION_RATE)
  end

  def print_train
    space_count = Terminal.columns - @moves

    if space_count < 0
      print(train[space_count.abs..-1])
    else
      print(" " * space_count)

      cut_off = Terminal.columns - (train_length + space_count)
      cut_off = 0 if cut_off > -1
      end_of_train = -1 + cut_off
      print(train[0..end_of_train])
    end
  end

  def move_left
    @moves += 1
    @moves = 0 if @moves > Terminal.columns + train_length
  end
end
