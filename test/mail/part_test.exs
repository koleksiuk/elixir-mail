defmodule Mail.PartTest do
  use ExUnit.Case

  test "put_data" do
    part = Mail.Part.put_data(%Mail.Part{}, "some data")

    assert part.data == "some data"
  end

  test "put_header" do
    part = Mail.Part.put_header(%Mail.Part{}, :content_type, "text/plain")

    assert part.headers.content_type == "text/plain"
  end

  test "put_content_type" do
    part = Mail.Part.put_content_type(%Mail.Part{}, "text/plain")

    assert part.headers.content_type == "text/plain"
  end
end
