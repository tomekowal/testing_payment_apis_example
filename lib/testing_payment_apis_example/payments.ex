defmodule TestingPaymentApisExample.Payments do
  @moduledoc """
  The Payments context.
  """

  import Ecto.Query, warn: false
  alias TestingPaymentApisExample.Repo

  alias TestingPaymentApisExample.Payments.Authorization

  @doc """
  Returns the list of authorizations.

  ## Examples

      iex> list_authorizations()
      [%Authorization{}, ...]

  """
  def list_authorizations do
    Repo.all(Authorization)
  end

  @doc """
  Gets a single authorization.

  Raises `Ecto.NoResultsError` if the Authorization does not exist.

  ## Examples

      iex> get_authorization!(123)
      %Authorization{}

      iex> get_authorization!(456)
      ** (Ecto.NoResultsError)

  """
  def get_authorization!(id), do: Repo.get!(Authorization, id)

  @doc """
  Creates a authorization.

  ## Examples

      iex> create_authorization(%{field: value})
      {:ok, %Authorization{}}

      iex> create_authorization(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_authorization(attrs \\ %{}) do
    %Authorization{}
    |> Authorization.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a authorization.

  ## Examples

      iex> update_authorization(authorization, %{field: new_value})
      {:ok, %Authorization{}}

      iex> update_authorization(authorization, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_authorization(%Authorization{} = authorization, attrs) do
    authorization
    |> Authorization.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a authorization.

  ## Examples

      iex> delete_authorization(authorization)
      {:ok, %Authorization{}}

      iex> delete_authorization(authorization)
      {:error, %Ecto.Changeset{}}

  """
  def delete_authorization(%Authorization{} = authorization) do
    Repo.delete(authorization)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking authorization changes.

  ## Examples

      iex> change_authorization(authorization)
      %Ecto.Changeset{data: %Authorization{}}

  """
  def change_authorization(%Authorization{} = authorization, attrs \\ %{}) do
    Authorization.changeset(authorization, attrs)
  end
end
