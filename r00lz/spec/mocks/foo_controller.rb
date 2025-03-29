class FooController < R00lz::Controller
  def bar; "FooBar controller"; end

  def my_model
    q = FileModel.find(1)
    q["text"]
  end
end
