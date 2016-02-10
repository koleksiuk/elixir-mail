defmodule PartsTest do
  use ExUnit.Case

  test "put_part" do
    part = %Mail.Part{}
    mail = Mail.put_part(%Mail{}, part)

    assert length(mail.parts) == 1
    assert Enum.member?(mail.parts, part)
  end

  test "delete_part" do
    mail = Mail.put_text(%Mail{}, "Some text")

    assert length(mail.parts) == 1
    part = List.first(mail.parts)

    mail = Mail.delete_part(mail, part)

    assert mail.parts == []
  end

  test "ensure only `Mail.Part` structs can be used" do
    assert_raise FunctionClauseError, fn ->
      Mail.put_part(%Mail{}, nil)
    end
  end

  test "put_text" do
    mail = Mail.put_text(%Mail{}, "Some text")

    assert length(mail.parts) == 1
    part = List.first(mail.parts)

    assert part.data == "Some text"
    assert part.headers.content_type == "text/plain"
  end

  test "put_text replaces existing text part" do
    mail =
      Mail.put_text(%Mail{}, "Some text")
      |> Mail.put_text("Some other text")

    assert length(mail.parts) == 1
    part = List.first(mail.parts)

    assert part.data == "Some other text"
    assert part.headers.content_type == "text/plain"
  end

  test "put_html" do
    mail = Mail.put_html(%Mail{}, "Some html")

    assert length(mail.parts) == 1
    part = List.first(mail.parts)

    assert part.data == "Some html"
    assert part.headers.content_type == "text/html"
  end

  test "put_html replaces existing html part" do
    mail =
      Mail.put_html(%Mail{}, "Some html")
      |> Mail.put_html("Some other html")

    assert length(mail.parts) == 1
    part = List.first(mail.parts)

    assert part.data == "Some other html"
    assert part.headers.content_type == "text/html"
  end
end
