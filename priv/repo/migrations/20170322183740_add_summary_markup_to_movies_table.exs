defmodule Teacher.Repo.Migrations.AddSummaryMarkupToMoviesTable do
  use Ecto.Migration

  def change do
    alter table(:movies) do
      add :summary_markup, :text
    end
  end
end
