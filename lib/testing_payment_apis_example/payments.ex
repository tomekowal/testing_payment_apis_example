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

  alias TestingPaymentApisExample.Payments.Capture

  @doc """
  Returns the list of captures.

  ## Examples

      iex> list_captures()
      [%Capture{}, ...]

  """
  def list_captures do
    Repo.all(Capture)
  end

  @doc """
  Gets a single capture.

  Raises `Ecto.NoResultsError` if the Capture does not exist.

  ## Examples

      iex> get_capture!(123)
      %Capture{}

      iex> get_capture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_capture!(id), do: Repo.get!(Capture, id)

  @doc """
  Creates a capture.

  ## Examples

      iex> create_capture(%{field: value})
      {:ok, %Capture{}}

      iex> create_capture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_capture(attrs \\ %{}) do
    %Capture{}
    |> Capture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a capture.

  ## Examples

      iex> update_capture(capture, %{field: new_value})
      {:ok, %Capture{}}

      iex> update_capture(capture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_capture(%Capture{} = capture, attrs) do
    capture
    |> Capture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a capture.

  ## Examples

      iex> delete_capture(capture)
      {:ok, %Capture{}}

      iex> delete_capture(capture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_capture(%Capture{} = capture) do
    Repo.delete(capture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking capture changes.

  ## Examples

      iex> change_capture(capture)
      %Ecto.Changeset{data: %Capture{}}

  """
  def change_capture(%Capture{} = capture, attrs \\ %{}) do
    Capture.changeset(capture, attrs)
  end

  alias TestingPaymentApisExample.Payments.Refund

  @doc """
  Returns the list of refunds.

  ## Examples

      iex> list_refunds()
      [%Refund{}, ...]

  """
  def list_refunds do
    Repo.all(Refund)
  end

  @doc """
  Gets a single refund.

  Raises `Ecto.NoResultsError` if the Refund does not exist.

  ## Examples

      iex> get_refund!(123)
      %Refund{}

      iex> get_refund!(456)
      ** (Ecto.NoResultsError)

  """
  def get_refund!(id), do: Repo.get!(Refund, id)

  @doc """
  Creates a refund.

  ## Examples

      iex> create_refund(%{field: value})
      {:ok, %Refund{}}

      iex> create_refund(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_refund(attrs \\ %{}) do
    %Refund{}
    |> Refund.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a refund.

  ## Examples

      iex> update_refund(refund, %{field: new_value})
      {:ok, %Refund{}}

      iex> update_refund(refund, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_refund(%Refund{} = refund, attrs) do
    refund
    |> Refund.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a refund.

  ## Examples

      iex> delete_refund(refund)
      {:ok, %Refund{}}

      iex> delete_refund(refund)
      {:error, %Ecto.Changeset{}}

  """
  def delete_refund(%Refund{} = refund) do
    Repo.delete(refund)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking refund changes.

  ## Examples

      iex> change_refund(refund)
      %Ecto.Changeset{data: %Refund{}}

  """
  def change_refund(%Refund{} = refund, attrs \\ %{}) do
    Refund.changeset(refund, attrs)
  end
end
