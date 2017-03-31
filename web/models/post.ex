defmodule Teacher.Post do
  use Teacher.Web, :model

  #Let’s go back to our ‘post.ex’ file, since we’re using Ecto in the project we’ll need to derive the protocol before the schema. We can also delete our custom implementation we previously used. 
  @derive {Phoenix.Param, key: :slug}
  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    has_many :comments, Teacher.Comment
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))
    struct
    |> cast(params, [:title, :body, :slug])
    |> validate_required([:title, :body])
  end

  defp slug_map(%{"title" => title}) do
    slug = String.downcase(title) |> String.replace(" ", "-")
    %{"slug" => slug}
  end

  defp slug_map(_params) do
      %{}
  end

end

# defimpl Phoenix.Param, for: Teacher.Post do
#   def to_param(%{slug: slug}) do
#     "#{slug}"
#   end
# end
