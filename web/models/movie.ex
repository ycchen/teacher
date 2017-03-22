defmodule Teacher.Movie do
  use Teacher.Web, :model

  schema "movies" do
    field :title, :string
    field :summary, :string
    field :summary_markup, :string
    field :year, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :summary, :summary_markup, :year])
    |> validate_required([:title, :summary, :summary_markup, :year])
  end
end
