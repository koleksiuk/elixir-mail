defmodule Mail.Part do
  defstruct data: nil,
            headers: %{}

  @doc """
  Sets the `data` field on the struct

      Mail.Part.put_data(%Mail.Part{}, "Some data")
      %Mail.Part{data: "Some Data", headers: %{}}
  """
  def put_data(part, data),
    do: put_in(part.data, data)

  @doc """
  Add a new header key/value pair

      Mail.Part.put_header(%Mail.Part{}, :content_type, "text/plain")

  The individual headers will be in the `headers` field on the
  `%Mail.Part{}` struct
  """
  def put_header(part, key, content),
    do: put_in(part.headers[key], content)

  @doc """
  Add a new `content-type` header

      Mail.Part.put_content_type(%Mail.Part, "text/plain")
      %Mail.Part{headers: %{content_type: "text/plain"}}
  """
  def put_content_type(part, content_type),
    do: put_header(part, :content_type, content_type)
end
