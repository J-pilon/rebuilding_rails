class QController < R00lz::Controller
  def a_quote
    "What's up, Doc?"
  end

  def shakes
    @noun = :winking
    render(:shakes)
  end
end
