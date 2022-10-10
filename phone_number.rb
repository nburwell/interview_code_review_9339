require_relative "./phone_actions"

class PhoneNumber
  USERNAME = ENV['ACTIONS_USERNAME']
  PASSWORD = ENV['ACTIONS_PASSWORD']

  def initialize(number)
    @number = number
    @number = format_number
  end

  def text(message)
    PhoneActions.new(USERNAME, PASSWORD).text!(@number, message)
  end

  def call(message)
    PhoneActions.new(USERNAME, PASSWORD).call!(@number, message)
  end

  def text_and_call(message)
    PhoneActions.new(USERNAME, PASSWORD).text!(@number, message)
    PhoneActions.new(USERNAME, PASSWORD).call!(message, message)
  end

  def number
    @number
  end

  def to_i
    n = @number.gsub!(/[^0-9]/, "")
    n.to_i
  end

  private

  def format_number
    "(#{find_area_code}) #{find_exchange}-#{find_line_number}"
  end

  def find_area_code
    open_paren = @number.index('(')
    close_paren = @number.index(')')
    if open_paren
      if close_paren
        @number[(open_paren + 1)..(close_paren - 1)]
      end
    else
      @number.gsub!(/[^0-9]/, "")
      @number[0..2]
    end
  end

  def find_exchange
    @number.gsub!(/[^0-9]/, "")
    @number[3..5]
  end

  def find_line_number
    @number.gsub!(/[^0-9]/, "")
    @number[-4..@number.length]
  end
end

